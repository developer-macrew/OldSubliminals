import 'dart:convert';

import 'package:common/common.dart';
import 'package:common/model/subliminal.dart';
import '../model/engine_queue.dart';
import 'package:rest_client/rest_client.dart' as rc;

class EngineService {
  final String host;

  EngineService({required this.host});

  Future<Result<EngineQueue>> getQueue() async {
    try {
      final req = rc.Request(
        url: '$host/queue',
        method: rc.RequestMethod.get,
      );
      final resp = await rc.Client().execute(request: req);
      if (resp.statusCode != 200) {
        return Result.error(Errors.errorString(resp.statusCode));
      }
      return Result.ok(EngineQueue.fromJson(resp.body));
    } catch (e, s) {
      print('EngineService error: $e\n$s');
      return Result.error(Errors.unknown);
    }
  }

  Future<Result<SubliminalRequest>> create(
    SubliminalConfig config, {
    String? owner,
    String? title,
  }) async {
    try {
      Map<String, dynamic> payload = config.toJson();
      if (owner != null) payload['owner'] = owner;
      if (title != null) payload['title'] = title;
      final req = rc.Request(
        url: '$host/create',
        method: rc.RequestMethod.post,
        body: jsonEncode(payload),
      );
      final resp = await rc.Client().execute(request: req);
      if (resp.statusCode != 200) {
        return Result.error(Errors.errorString(resp.statusCode));
      }
      print(':::  $title , ${resp.body}');
      if (resp.body['error'] != null) {
        return Result.error(resp.body['error']);
      }

      return Result.ok(SubliminalRequest.fromJson(resp.body));
    } catch (e, s) {
      print('Create request error: $e\n$s');
      return Result.error(Errors.unknown);
    }
  }

  Future<Result<Subliminal>> getSubliminal(String id) async {
    try {
      final req = rc.Request(url: '$host/get/$id');
      final resp = await rc.Client().execute(request: req);
      if (resp.statusCode != 200) {
        return Result.error(Errors.errorString(resp.statusCode));
      }
      return Result.ok(Subliminal.fromJson(resp.body));
    } catch (e, s) {
      print('Get request error: $e\n$s');
      return Result.error(Errors.unknown);
    }
  }

  Future<Result<bool>> deleteSubliminal(String id) async {
    try {
      final req = rc.Request(
        url: '$host/delete/$id',
        method: rc.RequestMethod.post,
      );
      final resp = await rc.Client().execute(request: req);
      if (resp.statusCode != 200) {
        return Result.error(Errors.errorString(resp.statusCode));
      }
      return Result.ok(true);
    } catch (e, s) {
      print('Delete request error: $e\n$s');
      return Result.error(Errors.unknown);
    }
  }
}
