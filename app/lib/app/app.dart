import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subliminal/app/router.dart';
import 'package:subliminal/app/theme.dart';
import 'package:subliminal/controllers/auth_controller.dart';
import 'package:subliminal/controllers/meta_controller.dart';
import 'package:subliminal/controllers/user_subs_controller.dart';
import 'package:subliminal/services/service_locator.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appKey = GlobalKey();
  final _router = buildRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthController>(
          create: (_) => auth(),
          lazy: false,
        ),
        BlocProvider<MetaController>(
          create: (_) => MetaController(),
        ),
        BlocProvider<UserSubsController>(
          create: (_) => userSubs(),
        ),
      ],
      child: MaterialApp.router(
        key: _appKey,
        title: 'Success Subliminals',
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        theme: mainTheme,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success Subliminals'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
