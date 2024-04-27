import 'package:codeblurb_mobile/generated/fonts.gen.dart';
import 'package:codeblurb_mobile/theme/colors/codeblurb_colors.dart';
import 'package:flutter/material.dart';

final _lightColors = LightColors();
final _darkColors = DarkColors();

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: FontFamily.inter,
    cardColor: _lightColors.card,
    canvasColor: _lightColors.background,
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: TextStyle(
        color: _lightColors.destructive,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _lightColors.destructive,
          width: 2,
        ),
      ),
      activeIndicatorBorder: BorderSide(
        color: _lightColors.ring,
        width: 2,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _lightColors.ring,
          width: 2,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _lightColors.border,
          width: 1.5,
        ),
      ),
    ),
    scaffoldBackgroundColor: _lightColors.background,
    dividerColor: _lightColors.border,
    disabledColor: _lightColors.muted,
    highlightColor: _lightColors.accentForeground,
    splashColor: _lightColors.accent,
    hintColor: _lightColors.border,
    colorScheme: ColorScheme.light(
      primary: _lightColors.primary,
      background: _lightColors.background,
      error: _lightColors.destructive,
      onError: _lightColors.destructiveForeground,
      onPrimary: _lightColors.primaryForeground,
      onSecondary: _lightColors.secondaryForeground,
      onBackground: _lightColors.foreground,
      surface: _lightColors.card,
      onSurface: _lightColors.cardForeground,
      secondary: _lightColors.secondary,
      outline: _lightColors.border,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: FontFamily.inter,
    cardColor: _darkColors.card,
    canvasColor: _darkColors.background,
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: TextStyle(
        color: _darkColors.destructive,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _darkColors.destructive,
          width: 2,
        ),
      ),
      activeIndicatorBorder: BorderSide(
        color: _darkColors.ring,
        width: 2,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _darkColors.ring,
          width: 2,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _darkColors.border,
          width: 1.5,
        ),
      ),
    ),
    scaffoldBackgroundColor: _darkColors.background,
    dividerColor: _darkColors.border,
    disabledColor: _darkColors.muted,
    highlightColor: _darkColors.accentForeground,
    splashColor: _darkColors.accent,
    hintColor: _darkColors.border,
    colorScheme: ColorScheme.dark(
      primary: _darkColors.primary,
      background: _darkColors.background,
      error: _darkColors.destructive,
      onError: _darkColors.destructiveForeground,
      onPrimary: _darkColors.primaryForeground,
      onSecondary: _darkColors.secondaryForeground,
      onBackground: _darkColors.foreground,
      surface: _darkColors.card,
      onSurface: _darkColors.cardForeground,
      secondary: _darkColors.secondary,
      outline: _darkColors.border,
    ),
  );
}
