import 'package:flutter/material.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  void changerThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      save();
    }
  }

  save() {
    //TODO
  }
}
