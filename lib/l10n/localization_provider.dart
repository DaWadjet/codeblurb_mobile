import 'package:codeblurb_mobile/l10n/language.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationProviderWidget extends StatelessWidget {
  const LocalizationProviderWidget({
    required this.child,
    super.key,
    this.useRootBundleAssetLoader = false,
  });

  final Widget child;
  final bool useRootBundleAssetLoader;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales:
          Language.values.map((language) => language.asLocale).toList(),
      path: 'assets/translations',
      useFallbackTranslations: true,
      fallbackLocale: Language.fallbackLocale,
      child: child,
    );
  }
}
