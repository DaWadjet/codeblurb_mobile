import 'package:codeblurb_mobile/theme/text_styles/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

extension BuildContextX on BuildContext {
  AppStyles get textStyles => Theme.of(this).extension<AppStyles>()!;

  double get bottomPadding {
    final padding = MediaQuery.viewPaddingOf(this).bottom;
    return padding == 0 ? 12 : padding;
  }

  double get topPadding => MediaQuery.viewPaddingOf(this).top;

  Future<T?> showBottomSheet<T>({
    required Widget content,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (_) => content,
    );
  }

  String formatDate(DateTime date, [String pattern = 'yyyy/MM/dd']) {
    return DateFormat(pattern, locale.languageCode).format(date);
  }

  bool get isFormValid => FormBuilder.of(this)?.validate() ?? false;
  bool isFormFieldValid(String fieldName) =>
      FormBuilder.of(this)?.fields[fieldName]?.validate() ?? false;
}
