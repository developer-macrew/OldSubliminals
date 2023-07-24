import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:subliminal/app/app.dart';
import 'package:subliminal/controllers/auth_controller.dart';
import 'package:subliminal/services/api/api_service.dart';
import 'package:subliminal/services/service_locator.dart';
import 'firebase_options.dart';

late PackageInfo packageInfo;

Future<void> _loadEnv() async {
  try {
    packageInfo = await PackageInfo.fromPlatform();
    await dotenv.load(fileName: '.env');
    if (dotenv.env['API_URL'] != null) ApiService.host = dotenv.env['API_URL']!;
  } catch (_) {
    print('Problem loading .env file');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _loadEnv();
  usePathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    AuthProviders.google,
  ]);
  setUpServiceLocator();
  runApp(MyApp());
}
