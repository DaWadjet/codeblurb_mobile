import 'package:flutter/material.dart';

abstract class ColorPalette {
  Color get background;
  Color get foreground;
  Color get card;
  Color get cardForeground;
  Color get popover;
  Color get popoverForeground;
  Color get primary;
  Color get primaryForeground;
  Color get secondary;
  Color get secondaryForeground;
  Color get muted;
  Color get mutedForeground;
  Color get accent;
  Color get accentForeground;
  Color get destructive;
  Color get destructiveForeground;
  Color get border;
  Color get input;
  Color get ring;
}

class LightColors extends ColorPalette {
  LightColors();
  @override
  Color get background => Colors.white;

  @override
  Color get foreground => const Color(0xFF09090b);

  @override
  Color get card => Colors.white;

  @override
  Color get cardForeground => const Color(0xFF09090b);

  @override
  Color get popover => Colors.white;

  @override
  Color get popoverForeground => const Color(0xFF09090b);

  @override
  Color get primary => const Color(0xFF18181b);

  @override
  Color get primaryForeground => const Color(0xFFfafafa);

  @override
  Color get secondary => const Color(0xFFf4f4f5);

  @override
  Color get secondaryForeground => const Color(0xFF18181b);

  @override
  Color get muted => const Color(0xFFf4f4f5);

  @override
  Color get mutedForeground => const Color(0xFF71717a);

  @override
  Color get accent => const Color(0xFFf4f4f5);

  @override
  Color get accentForeground => const Color(0xFF18181b);

  @override
  Color get destructive => const Color(0xFFef4444);

  @override
  Color get destructiveForeground => const Color(0xFFfafafa);

  @override
  Color get border => const Color(0xFFe4e4e7);

  @override
  Color get input => const Color(0xFFe4e4e7);

  @override
  Color get ring => const Color(0xFF18181b);
}

class DarkColors extends ColorPalette {
  @override
  Color get background => const Color(0xFF09090b);

  @override
  Color get foreground => const Color(0xFFfafafa);

  @override
  Color get card => const Color(0xFF09090b);

  @override
  Color get cardForeground => const Color(0xFFfafafa);

  @override
  Color get popover => const Color(0xFF09090b);

  @override
  Color get popoverForeground => const Color(0xFFfafafa);

  @override
  Color get primary => const Color(0xFFfafafa);

  @override
  Color get primaryForeground => const Color(0xFF18181b);

  @override
  Color get secondary => const Color(0xFF27272a);

  @override
  Color get secondaryForeground => const Color(0xFFfafafa);

  @override
  Color get muted => const Color(0xFF27272a);

  @override
  Color get mutedForeground => const Color(0xFFa1a1aa);

  @override
  Color get accent => const Color(0xFF27272a);

  @override
  Color get accentForeground => const Color(0xFFfafafa);

  @override
  Color get destructive => const Color(0xffdc2828);

  @override
  Color get destructiveForeground => const Color(0xFFfafafa);

  @override
  Color get border => const Color(0xFF27272a);

  @override
  Color get input => const Color(0xFF27272a);

  @override
  Color get ring => const Color(0xFFd4d4d8);
}
