import 'package:codeblurb_mobile/theme/text_styles/codeblurb_styles.dart';
import 'package:flutter/material.dart';

@immutable
class AppStyles extends ThemeExtension<AppStyles> {
  const AppStyles({
    required this.header1,
    required this.header2,
    required this.header3,
    required this.header4,
    required this.header5,
    required this.header6,
    required this.subheader1,
    required this.subheader2,
    required this.subheader3,
    required this.button,
    required this.body1,
    required this.body2,
    required this.caption,
    required this.underline,
  });

  factory AppStyles.defaultStyles() {
    return const AppStyles(
      header1: CodeblurbStyles.header1,
      header2: CodeblurbStyles.header2,
      header3: CodeblurbStyles.header3,
      header4: CodeblurbStyles.header4,
      header5: CodeblurbStyles.header5,
      header6: CodeblurbStyles.header6,
      subheader1: CodeblurbStyles.subheader1,
      subheader2: CodeblurbStyles.subheader2,
      subheader3: CodeblurbStyles.subheader3,
      button: CodeblurbStyles.button,
      body1: CodeblurbStyles.body1,
      body2: CodeblurbStyles.body2,
      caption: CodeblurbStyles.caption,
      underline: CodeblurbStyles.underline,
    );
  }

  final TextStyle header1;
  final TextStyle header2;
  final TextStyle header3;
  final TextStyle header4;
  final TextStyle header5;
  final TextStyle header6;
  final TextStyle subheader1;
  final TextStyle subheader2;
  final TextStyle subheader3;
  final TextStyle button;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle caption;
  final TextStyle underline;

  @override
  ThemeExtension<AppStyles> copyWith({
    TextStyle? header1,
    TextStyle? header2,
    TextStyle? header3,
    TextStyle? header4,
    TextStyle? header5,
    TextStyle? header6,
    TextStyle? subheader1,
    TextStyle? subheader2,
    TextStyle? subheader3,
    TextStyle? button,
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? caption,
    TextStyle? underline,
  }) {
    return AppStyles(
      header1: header1 ?? this.header1,
      header2: header2 ?? this.header2,
      header3: header3 ?? this.header3,
      header4: header4 ?? this.header4,
      header5: header5 ?? this.header5,
      header6: header6 ?? this.header6,
      subheader1: subheader1 ?? this.subheader1,
      subheader2: subheader2 ?? this.subheader2,
      subheader3: subheader3 ?? this.subheader3,
      button: button ?? this.button,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      caption: caption ?? this.caption,
      underline: underline ?? this.underline,
    );
  }

  @override
  ThemeExtension<AppStyles> lerp(
    covariant ThemeExtension<AppStyles>? other,
    double t,
  ) {
    if (other == null || other is! AppStyles) return this;
    return AppStyles(
      header1: TextStyle.lerp(header1, other.header1, t) ?? header1,
      header2: TextStyle.lerp(header2, other.header2, t) ?? header2,
      header3: TextStyle.lerp(header3, other.header3, t) ?? header3,
      header4: TextStyle.lerp(header4, other.header4, t) ?? header4,
      header5: TextStyle.lerp(header5, other.header5, t) ?? header5,
      header6: TextStyle.lerp(header6, other.header6, t) ?? header6,
      subheader1: TextStyle.lerp(subheader1, other.subheader1, t) ?? subheader1,
      subheader2: TextStyle.lerp(subheader2, other.subheader2, t) ?? subheader2,
      subheader3: TextStyle.lerp(subheader3, other.subheader3, t) ?? subheader3,
      button: TextStyle.lerp(button, other.button, t) ?? button,
      body1: TextStyle.lerp(body1, other.body1, t) ?? body1,
      body2: TextStyle.lerp(body2, other.body2, t) ?? body2,
      caption: TextStyle.lerp(caption, other.caption, t) ?? caption,
      underline: TextStyle.lerp(underline, other.underline, t) ?? underline,
    );
  }
}
