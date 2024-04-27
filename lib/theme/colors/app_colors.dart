import 'package:codeblurb_mobile/theme/colors/codeblurb_colors.dart';
import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.neutral950,
    required this.neutral900,
    required this.neutral800,
    required this.neutral700,
    required this.neutral600,
    required this.neutral500,
    required this.neutral400,
    required this.neutral300,
    required this.neutral200,
    required this.neutral100,
    required this.black,
    required this.background,
    required this.background2,
    required this.white,
    required this.gray,
    required this.bg1Gradient1,
    required this.bg1Gradient2,
    required this.bg1Gradient3,
    required this.bg2Gradient1,
    required this.bg2Gradient2,
    required this.error,
    required this.activity,
    required this.highlight,
    required this.highlight2,
    required this.beginner,
    required this.advanced,
    required this.professional,
    required this.yellow100,
    required this.yellow300,
  });

  factory AppColors.defaultColors() {
    return const AppColors(
      neutral950: CodeblurbColors.neutral950,
      neutral900: CodeblurbColors.neutral900,
      neutral800: CodeblurbColors.neutral800,
      neutral700: CodeblurbColors.neutral700,
      neutral600: CodeblurbColors.neutral600,
      neutral500: CodeblurbColors.neutral500,
      neutral400: CodeblurbColors.neutral400,
      neutral300: CodeblurbColors.neutral300,
      neutral200: CodeblurbColors.neutral200,
      neutral100: CodeblurbColors.neutral100,
      black: CodeblurbColors.black,
      background: CodeblurbColors.background,
      background2: CodeblurbColors.background2,
      white: CodeblurbColors.white,
      gray: CodeblurbColors.gray,
      bg1Gradient1: CodeblurbColors.bg1Gradient1,
      bg1Gradient2: CodeblurbColors.bg1Gradient2,
      bg1Gradient3: CodeblurbColors.bg1Gradient3,
      bg2Gradient1: CodeblurbColors.bg2Gradient1,
      bg2Gradient2: CodeblurbColors.bg2Gradient2,
      error: CodeblurbColors.error,
      activity: CodeblurbColors.activity,
      highlight: CodeblurbColors.highlight,
      highlight2: CodeblurbColors.highlight2,
      beginner: CodeblurbColors.beginner,
      advanced: CodeblurbColors.advanced,
      professional: CodeblurbColors.professional,
      yellow100: CodeblurbColors.yellow100,
      yellow300: CodeblurbColors.yellow300,
    );
  }

  final Color neutral950;
  final Color neutral900;
  final Color neutral800;
  final Color neutral700;
  final Color neutral600;
  final Color neutral500;
  final Color neutral400;
  final Color neutral300;
  final Color neutral200;
  final Color neutral100;
  final Color black;
  final Color background;
  final Color background2;
  final Color white;
  final Color gray;
  final Color bg1Gradient1;
  final Color bg1Gradient2;
  final Color bg1Gradient3;
  final Color bg2Gradient1;
  final Color bg2Gradient2;
  final Color error;
  final Color activity;
  final Color highlight;
  final Color highlight2;
  final Color beginner;
  final Color advanced;
  final Color professional;
  final Color yellow100;
  final Color yellow300;

  @override
  ThemeExtension<AppColors> copyWith({
    Color? neutral950,
    Color? neutral900,
    Color? neutral800,
    Color? neutral700,
    Color? neutral600,
    Color? neutral500,
    Color? neutral400,
    Color? neutral300,
    Color? neutral200,
    Color? neutral100,
    Color? black,
    Color? background,
    Color? background2,
    Color? white,
    Color? gray,
    Color? bg1Gradient1,
    Color? bg1Gradient2,
    Color? bg1Gradient3,
    Color? bg2Gradient1,
    Color? bg2Gradient2,
    Color? error,
    Color? activity,
    Color? highlight,
    Color? highlight2,
    Color? beginner,
    Color? advanced,
    Color? professional,
    Color? yellow100,
    Color? yellow300,
  }) {
    return AppColors(
      neutral950: neutral950 ?? this.neutral950,
      neutral900: neutral900 ?? this.neutral900,
      neutral800: neutral800 ?? this.neutral800,
      neutral700: neutral700 ?? this.neutral700,
      neutral600: neutral600 ?? this.neutral600,
      neutral500: neutral500 ?? this.neutral500,
      neutral400: neutral400 ?? this.neutral400,
      neutral300: neutral300 ?? this.neutral300,
      neutral200: neutral200 ?? this.neutral200,
      neutral100: neutral100 ?? this.neutral100,
      black: black ?? this.black,
      background: background ?? this.background,
      background2: background2 ?? this.background2,
      white: white ?? this.white,
      gray: gray ?? this.gray,
      bg1Gradient1: bg1Gradient1 ?? this.bg1Gradient1,
      bg1Gradient2: bg1Gradient2 ?? this.bg1Gradient2,
      bg1Gradient3: bg1Gradient3 ?? this.bg1Gradient3,
      bg2Gradient1: bg2Gradient1 ?? this.bg2Gradient1,
      bg2Gradient2: bg2Gradient2 ?? this.bg2Gradient2,
      error: error ?? this.error,
      activity: activity ?? this.activity,
      highlight: highlight ?? this.highlight,
      highlight2: highlight2 ?? this.highlight2,
      beginner: beginner ?? this.beginner,
      advanced: advanced ?? this.advanced,
      professional: professional ?? this.professional,
      yellow100: yellow100 ?? this.yellow100,
      yellow300: yellow300 ?? this.yellow300,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other == null || other is! AppColors) return this;
    return AppColors(
      neutral950: Color.lerp(neutral950, other.neutral950, t) ?? neutral950,
      neutral900: Color.lerp(neutral900, other.neutral900, t) ?? neutral900,
      neutral800: Color.lerp(neutral800, other.neutral800, t) ?? neutral800,
      neutral700: Color.lerp(neutral700, other.neutral700, t) ?? neutral700,
      neutral600: Color.lerp(neutral600, other.neutral600, t) ?? neutral600,
      neutral500: Color.lerp(neutral500, other.neutral500, t) ?? neutral500,
      neutral400: Color.lerp(neutral400, other.neutral400, t) ?? neutral400,
      neutral300: Color.lerp(neutral300, other.neutral300, t) ?? neutral300,
      neutral200: Color.lerp(neutral200, other.neutral200, t) ?? neutral200,
      neutral100: Color.lerp(neutral100, other.neutral100, t) ?? neutral100,
      black: Color.lerp(black, other.black, t) ?? black,
      background: Color.lerp(background, other.background, t) ?? background,
      background2: Color.lerp(background2, other.background2, t) ?? background2,
      white: Color.lerp(white, other.white, t) ?? white,
      gray: Color.lerp(gray, other.gray, t) ?? gray,
      bg1Gradient1:
          Color.lerp(bg1Gradient1, other.bg1Gradient1, t) ?? bg1Gradient1,
      bg1Gradient2:
          Color.lerp(bg1Gradient2, other.bg1Gradient2, t) ?? bg1Gradient2,
      bg1Gradient3:
          Color.lerp(bg1Gradient3, other.bg1Gradient3, t) ?? bg1Gradient3,
      bg2Gradient1:
          Color.lerp(bg2Gradient1, other.bg2Gradient1, t) ?? bg2Gradient1,
      bg2Gradient2:
          Color.lerp(bg2Gradient2, other.bg2Gradient2, t) ?? bg2Gradient2,
      error: Color.lerp(error, other.error, t) ?? error,
      activity: Color.lerp(activity, other.activity, t) ?? activity,
      highlight: Color.lerp(highlight, other.highlight, t) ?? highlight,
      highlight2: Color.lerp(highlight2, other.highlight2, t) ?? highlight2,
      beginner: Color.lerp(beginner, other.beginner, t) ?? beginner,
      advanced: Color.lerp(advanced, other.advanced, t) ?? advanced,
      professional:
          Color.lerp(professional, other.professional, t) ?? professional,
      yellow100: Color.lerp(yellow100, other.yellow100, t) ?? yellow100,
      yellow300: Color.lerp(yellow300, other.yellow300, t) ?? yellow300,
    );
  }
}
