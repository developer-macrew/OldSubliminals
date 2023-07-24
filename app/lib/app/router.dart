import 'package:go_router/go_router.dart';
import 'package:subliminal/pages/account_page.dart';
import 'package:subliminal/pages/create_page.dart';
import 'package:subliminal/pages/home_page.dart';
import 'package:subliminal/pages/library_page.dart';
import 'package:subliminal/pages/login_page.dart';
import 'package:subliminal/services/service_locator.dart';

class Routes {
  static const home = '/';
  static const login = '/login';
  static const account = '/account';
  static const create = '/create';
  static const library = '/library';
}

GoRouter buildRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (_, __) => const HomePage(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (_, __) => const LoginPage(),
        redirect: (_, __) async =>
            auth().state.loggedIn ? Routes.account : null,
      ),
      GoRoute(
        path: Routes.account,
        builder: (_, __) => const AccountPage(),
        redirect: (_, __) async => auth().state.loggedIn ? null : Routes.login,
      ),
      GoRoute(
        path: Routes.create,
        builder: (_, __) => const CreatePage(),
        redirect: (_, __) async => auth().state.loggedIn ? null : Routes.login,
      ),
      GoRoute(
        path: Routes.library,
        builder: (_, __) => const LibraryPage(),
        redirect: (_, __) async => auth().state.loggedIn ? null : Routes.login,
      ),
    ],
  );
}
