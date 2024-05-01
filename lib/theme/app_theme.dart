import 'package:codeblurb_mobile/generated/fonts.gen.dart';
import 'package:codeblurb_mobile/theme/colors/codeblurb_colors.dart';
import 'package:flutter/material.dart';

final _lightColors = LightColors();
final _darkColors = DarkColors();

abstract class AppTheme {
  static ThemeData _generateThemeData(
    ColorPalette colorPalette,
    Brightness brightness,
  ) =>
      ThemeData(
        brightness: brightness,
        bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorPalette.background,
          elevation: 0,
          iconTheme: IconThemeData(
            color: colorPalette.foreground,
          ),
          actionsIconTheme: IconThemeData(
            color: colorPalette.foreground,
          ),
          titleTextStyle: TextStyle(
            color: colorPalette.foreground,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        fontFamily: FontFamily.inter,
        dividerTheme: DividerThemeData(
          color: colorPalette.border,
          thickness: 1.5,
          indent: 12,
          endIndent: 12,
        ),
        cardTheme: CardTheme(
          color: colorPalette.card,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: colorPalette.border,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        canvasColor: colorPalette.background,
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(12),
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return colorPalette.accent.withOpacity(0.15);
                }
                return colorPalette.accent.withOpacity(0.05);
              },
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),
          errorStyle: TextStyle(
            color: colorPalette.destructive,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: colorPalette.destructive,
              width: 2,
            ),
          ),
          activeIndicatorBorder: BorderSide(
            color: colorPalette.ring,
            width: 2,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: colorPalette.ring,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: colorPalette.border,
              width: 1.5,
            ),
          ),
        ),
        scaffoldBackgroundColor: colorPalette.background,
        dividerColor: colorPalette.border,
        disabledColor: colorPalette.muted,
        highlightColor: colorPalette.mutedForeground.withOpacity(0.15),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return colorPalette.mutedForeground;
                }
                if (states.contains(MaterialState.pressed) ||
                    states.contains(MaterialState.hovered)) {
                  return colorPalette.primary.withOpacity(0.9);
                }
                return colorPalette.primary;
              },
            ),
            side: MaterialStateProperty.resolveWith<BorderSide>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return BorderSide(
                    color: colorPalette.muted,
                  );
                }
                return BorderSide(
                  color: colorPalette.primary.withOpacity(0.9),
                );
              },
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return colorPalette.mutedForeground;
                }
                if (states.contains(MaterialState.pressed) ||
                    states.contains(MaterialState.hovered)) {
                  return colorPalette.primary.withOpacity(0.9);
                }
                return colorPalette.primary;
              },
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return colorPalette.muted;
                }
                if (states.contains(MaterialState.pressed) ||
                    states.contains(MaterialState.hovered)) {
                  return colorPalette.primary.withOpacity(0.9);
                }
                return colorPalette.primary;
              },
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return colorPalette.mutedForeground;
                }

                return colorPalette.primaryForeground;
              },
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colorPalette.background,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedLabelStyle: TextStyle(
            color: colorPalette.foreground,
            fontSize: 12,
            height: 2,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            color: colorPalette.foreground.withOpacity(0.3),
            fontSize: 12,
            height: 2,
            fontWeight: FontWeight.w500,
          ),
          showSelectedLabels: true,
          selectedIconTheme: IconThemeData(
            color: colorPalette.foreground,
          ),
          unselectedIconTheme: IconThemeData(
            color: colorPalette.foreground.withOpacity(0.5),
          ),
          showUnselectedLabels: true,
          selectedItemColor: colorPalette.foreground,
          unselectedItemColor: colorPalette.foreground.withOpacity(0.5),
        ),
        splashColor: colorPalette.accent,
        hintColor: colorPalette.mutedForeground,
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: colorPalette.primary,
          background: colorPalette.background,
          error: colorPalette.destructive,
          onError: colorPalette.destructiveForeground,
          onPrimary: colorPalette.primaryForeground,
          onSecondary: colorPalette.secondaryForeground,
          onBackground: colorPalette.foreground,
          surface: colorPalette.card,
          onSurface: colorPalette.cardForeground,
          secondary: colorPalette.secondary,
          outline: colorPalette.border,
        ),
      );

  static ThemeData lightTheme =
      _generateThemeData(_lightColors, Brightness.light);
  static ThemeData darkTheme = _generateThemeData(_darkColors, Brightness.dark);
}
