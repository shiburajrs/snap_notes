import 'package:flutter/material.dart';

class ThemeManager {
  ThemeData _lightTheme = ThemeData.light();
  ThemeData _darkTheme = ThemeData.dark();

  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;

  ThemeData currentTheme(bool isDarkMode) {
    return isDarkMode ? _darkTheme : _lightTheme;
  }
}