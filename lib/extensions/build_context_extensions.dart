import 'package:codeblurb_mobile/theme/colors/app_colors.dart';
import 'package:codeblurb_mobile/theme/text_styles/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
  AppStyles get textStyles => Theme.of(this).extension<AppStyles>()!;

  double get bottomPadding {
    final padding = MediaQuery.paddingOf(this).bottom;
    return padding == 0 ? 12 : padding;
  }

  double get topPadding => MediaQuery.paddingOf(this).top;

  Future<T?> showBottomSheet<T>({
    required Widget content,
    Color? backgroundColor,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => content,
    );
  }

  String formatDate(String? pattern, DateTime date) {
    return DateFormat(pattern, locale.languageCode).format(date);
  }
}
