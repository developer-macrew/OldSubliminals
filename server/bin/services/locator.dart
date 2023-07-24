import 'package:firebase_admin_sdk/firebase_admin.dart';
import 'package:get_it/get_it.dart';
import 'package:stash/stash_api.dart';
import 'package:stash_memory/stash_memory.dart';

import '../store/subliminal_store.dart';
import '../store/user_store.dart';
import 'engine_service.dart';
import 'environment.dart';
import 'mongo_service.dart';
import 'queue_manager.dart';
import 'spaces_service.dart';

GetIt getIt = GetIt.I;

Auth auth() => getIt.get<Auth>();
MongoService db() => getIt.get<MongoService>();
EngineService engine() => getIt.get<EngineService>();
Environment env() => getIt.get<Environment>();
MemoryCacheStore store() => getIt.get<MemoryCacheStore>();
SpacesService spaces() => getIt.get<SpacesService>();
SubliminalStore subliminalStore() => getIt.get<SubliminalStore>();
QueueManager queue() => getIt.get<QueueManager>();
UserStore userStore() => getIt.get<UserStore>();

Future<void> setUpServiceLocator({
  required Environment environment,
  required MongoService db,
}) async {
  getIt.registerSingleton<Environment>(environment);
  final fbApp = App(
    'subliminal-298203',
    AppOptions(
        credential:
            environment.googleCredential ?? Credentials.applicationDefault()!),
  );
  getIt.registerSingleton<MongoService>(db);
  getIt.registerSingleton<MemoryCacheStore>(MemoryCacheStore());
  getIt.registerSingleton<Auth>(Auth(fbApp));
  getIt.registerSingleton<EngineService>(
      EngineService(host: environment.engineUrl));
  getIt.registerSingleton<SpacesService>(SpacesService(environment));
  getIt.registerSingleton<QueueManager>(QueueManager());
  getIt.registerSingleton<SubliminalStore>(SubliminalStore(db));
  getIt.registerSingleton<UserStore>(UserStore(db));
}
