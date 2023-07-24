import 'package:common/model/server_meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:subliminal/app/router.dart';
import 'package:subliminal/controllers/meta_controller.dart';
import 'package:subliminal/ui/scaffold.dart';
import 'package:subliminal/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SScaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Success Subliminals'),
              TextButton(
                onPressed: () => context.go(Routes.login),
                child: const Text('Login'),
              ),
              // const Spacer(),
              BlocBuilder<MetaController, ServerMeta>(
                builder: (_, state) => Text(
                    'Version ${packageInfo.version}, server: ${state.version}'),
              ),
              Text('hello again again'),
            ],
          ),
        ),
      ),
    );
  }
}
