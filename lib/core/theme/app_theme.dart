import 'package:codeblurb_mobile/core/theme/colors/app_colors.dart';
import 'package:codeblurb_mobile/core/theme/text_styles/app_styles.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData dark = ThemeData(
    fontFamily: 'Montserrat',
    useMaterial3: true,
    extensions: [
      AppColors.defaultColors(),
      AppStyles.defaultStyles(),
    ],
  );
}
