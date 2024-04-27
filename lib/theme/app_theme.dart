import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData defaultTheme = ThemeData();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
  );
}
