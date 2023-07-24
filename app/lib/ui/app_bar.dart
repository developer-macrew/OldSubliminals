import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subliminal/app/router.dart';
import 'package:subliminal/controllers/auth_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:subliminal/services/service_locator.dart';
import 'package:subliminal/ui/subtle_button.dart';

class SAppBar extends StatelessWidget {
  const SAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthController, AuthState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/banner.png'),
            ),
          ),
          Flexible(
            child: Row(
              children: [
                if (state.loggedIn)
                  SubtleButton(
                    text: 'Create New',
                    onPressed: () => context.go(Routes.create),
                  ),
                const SizedBox(width: 20),
                if (state.loggedIn)
                  SubtleButton(
                    text: 'Library',
                    onPressed: () => context.go(Routes.library),
                  )
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                const Spacer(),
                ..._accountButtons(context, state),
              ],
            ),
          ),
        ],
      );
    });
  }

  List<Widget> _accountButtons(BuildContext context, AuthState state) {
    if (state.loggedIn) {
      return [
        GestureDetector(
          onLongPress: () async => debugPrint(await auth().getIdToken() ?? ''),
          child: SubtleButton(
            onPressed: () => context.go(Routes.account),
            text: state.user!.name ?? 'User',
          ),
        ),
        GestureDetector(
          onLongPress: () async => debugPrint(await auth().getIdToken() ?? ''),
          child: SubtleButton(
            onPressed: () => auth().logOut(),
            text: 'Log Out',
          ),
        ),
      ];
    } else {
      return [
        SubtleButton(
          onPressed: () => context.go(Routes.login),
          text: 'LOGIN',
        ),
      ];
    }
  }
}
