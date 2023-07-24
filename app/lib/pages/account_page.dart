import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subliminal/controllers/auth_controller.dart';
import 'package:subliminal/services/api/api_service.dart';
import 'package:subliminal/ui/scaffold.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SScaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              BlocBuilder<AuthController, AuthState>(
                builder: (context, state) {
                  if (!state.loggedIn) {
                    return const CircularProgressIndicator();
                  }
                  final user = state.user!;
                  return Column(
                    children: [
                      Text(user.id),
                      Text(user.email ?? ''),
                      Text(user.name ?? ''),
                      Text(ApiService.host),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
