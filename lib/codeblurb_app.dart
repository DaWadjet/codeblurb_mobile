import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CodeblurbApp extends StatefulWidget {
  const CodeblurbApp({super.key});

  @override
  State<CodeblurbApp> createState() => _CodeblurbAppState();
}

class _CodeblurbAppState extends State<CodeblurbApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router.config(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      builder: (context, child) => _Unfocus(child: child!),
    );
  }
}

class _Unfocus extends StatelessWidget {
  const _Unfocus({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
