import 'dart:async';

import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/theme/app_theme.dart';
import 'package:codeblurb_mobile/widgets/platform_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeblurbApp extends ConsumerWidget {
  const CodeblurbApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    ref.listen(sessionErrorProvider, (previous, next) {
      showDialog<void>(
        context: context,
        builder: (_) => PlatformDialog(
          title: 'Session expired',
          onTap: () async {
            await ref.read(authRepositoryProvider).logout();
            if (!context.mounted) return;
            unawaited(
              ref.read(routerProvider).replaceAll([const LoginRoute()]),
            );
          },
        ),
      );
    });
    return MaterialApp.router(
      routerConfig: router.config(),
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
