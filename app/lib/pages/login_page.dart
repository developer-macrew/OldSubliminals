import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:firebase_ui_oauth/src/oauth_provider_button_base.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as ffui;
import 'package:subliminal/app/router.dart';
import 'package:subliminal/controllers/auth_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:subliminal/ui/scaffold.dart';

class LoginPage extends StatelessWidget {
  final String? redirect;
  const LoginPage({Key? key, this.redirect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SScaffold(
      body: BlocListener<AuthController, AuthState>(
        listener: (context, state) {
          print('bloc listener new state ${state.firebaseUser} ${state.user}');
          if (state.loggedIn) {
            context.go(redirect ?? Routes.account);
          }
        },
        child:
            BlocBuilder<AuthController, AuthState>(builder: (context, state) {
          if (state.working) {
            return const Center(
              child: Text('Logging in...'),
            );
          }
          // todo: figure out why this doesn't work
          // return Column(
          //   children: [
          //     OAuthProviderButton(provider: AuthProviders.google),
          //   ],
          // );
          return ffui.SignInScreen(
            actions: [
              ffui.AuthStateChangeAction<ffui.SignedIn>(
                (context, state) {
                  if (state.user != null) {
                    state.user!.getIdToken().then((value) => print(value));
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
