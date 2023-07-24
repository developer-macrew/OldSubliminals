import 'package:flutter/material.dart';
import 'package:subliminal/ui/app_bar.dart';

class SScaffold extends StatelessWidget {
  final Widget body;
  const SScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SAppBar(),
          Expanded(child: body),
        ],
      ),
    );
  }
}
