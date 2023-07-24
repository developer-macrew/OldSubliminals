import 'package:common/common.dart';
import 'package:secretary/secretary.dart' hide Result;

import '../model/engine_queue.dart';
import '../services/locator.dart';

import 'entity_store.dart';

class SubliminalStore extends EntityStore<Subliminal> with ReadyManager {
  final Secretary<String, Result<Subliminal>> secretary = Secretary(
    maxAttempts: 5,
    validator: (res) => res.ok ? null : res.error!,
  );
  SubliminalStore(super.db) {
    init();
  }

  List<SubliminalRequest> requests = [];

  @override
  Transformer<Subliminal> get transformer => withDownloadUrl;

  @override
  void initialise() async {
    queue().stream.listen(_onEngineQueue);
    setReady();
  }

  Future<void> _onEngineQueue(EngineQueue data) async {
    for (String id in data.ready) {
      if (items.containsKey(id)) continue;
      secretary.add(id, () => _getFromEngine(id));
    }
  }

  Future<Result<Subliminal>> _getFromEngine(String id) async {
    final result = await engine().getSubliminal(id);
    if (!result.ok) return result;
    await write(result.object!);
    await engine().deleteSubliminal(id);
    requests.removeWhere((e) => e.id == id);
    return result;
  }

  // Future<Result<Subliminal>> get(String id) async {
  //   await ready;
  //   Subliminal? sub = await cache.get(id);
  //   if (sub == null) {
  //     final res = await db().get<Subliminal>(id);
  //     if (res.ok) {
  //       sub = res.object!;
  //       await cache.put(id, sub);
  //     }
  //   }
  //   if (sub == null) {
  //     return Result.error(Errors.notFound);
  //   }
  //   if (sub.url == null) {
  //     sub = sub.copyWith(url: await spaces().getDownloadUrl(sub.path));
  //     await cache.put(id, sub);
  //   }
  //   return Result.ok(sub);
  // }

  @override
  Future<Result<Subliminal>> get(String id, [bool forceUpdate = false]) async {
    await ready;
    if (!forceUpdate && items.containsKey(id)) return Result.ok(items[id]!);
    Result<Subliminal> result = await super.db.get<Subliminal>(id);
    if (!result.ok) return result;
    onGet(result.object!);
    return Result.ok(await withDownloadUrl(result.object!));
  }

  Future<List<Subliminal>> getByOwner(String? owner, {int? limit}) =>
      getManyByField('owner', owner, limit: limit);

  @override
  Future<void> onGet(Subliminal entity) async {
    if (entity.url == null) {
      entity = await withDownloadUrl(entity);
    }
    items[entity.id] = entity;
  }

  Future<Subliminal> withDownloadUrl(Subliminal sub) async {
    if (sub.url != null) return sub;
    return sub.copyWith(url: await spaces().getDownloadUrl(sub.path));
  }

  Future<Result<SubliminalRequest>> create(
    SubliminalConfig config, {
    String? owner,
    String? title,
  }) async {
    final result = await engine().create(config, owner: owner, title: title);
    if (!result.ok) return result;
    final request = result.object!;
    requests.add(request);
    return Result.ok(request);
  }

  List<SubliminalRequest> requestsForOwner(String owner) =>
      requests.where((e) => e.owner == owner).toList();
}
