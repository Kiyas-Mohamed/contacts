import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  bool _isDarkMode = false;

  ThemeData get currentTheme =>
      _isDarkMode ? ThemeData.dark() : ThemeData.light();

  bool get isDarkMode => _isDarkMode;

  void setDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
