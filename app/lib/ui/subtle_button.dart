import 'package:flutter/material.dart';

class SubtleButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final VoidCallback onPressed;
  const SubtleButton({
    super.key,
    this.text,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            if (icon != null) icon!,
            if (text != null) Text(text!),
          ],
        ),
      ),
    );
  }
}
