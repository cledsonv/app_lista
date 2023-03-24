import 'package:flutter/material.dart';

class UserImageButton extends StatelessWidget {
  const UserImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: themeScheme.primary,
        foregroundColor: themeScheme.onPrimary,
        child: const Text('A'),
      ),
    );
  }
}
