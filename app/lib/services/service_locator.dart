import 'package:get_it/get_it.dart';
import 'package:subliminal/controllers/auth_controller.dart';
import 'package:subliminal/controllers/user_subs_controller.dart';
import 'package:subliminal/services/api/api_service.dart';

GetIt getIt = GetIt.I;

AuthController auth() => getIt.get<AuthController>();
ApiService api() => getIt.get<ApiService>();
UserSubsController userSubs() => getIt.get<UserSubsController>();

Future<void> setUpServiceLocator() async {
  getIt.registerSingleton<AuthController>(AuthController());
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<UserSubsController>(UserSubsController());
}
