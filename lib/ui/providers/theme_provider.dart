import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  changeTheme(ThemeMode themeMode) {
    this.themeMode = themeMode;
    notifyListeners();
  }
}
