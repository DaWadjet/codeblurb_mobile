import 'dart:async';

import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/theme/app_theme.dart';
import 'package:codeblurb_mobile/widgets/platform_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
              ref.read(routerProvider).replaceAll([LoginRoute()]),
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
      builder: (context, child) => Overlay(
        initialEntries: [
          if (child != null) ...[
            OverlayEntry(
              builder: (context) => _Unfocus(child: child),
            ),
          ],
        ],
      ),
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
      child: _Toaster(child: child),
    );
  }
}

class _Toaster extends HookConsumerWidget {
  _Toaster({required this.child});

  late final FToast fToast = FToast();
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();

    useMemoized(() {
      fToast.init(context);
    });

    ref.listen(toastNotifierProvider, (previous, next) {
      if (next.isEmpty) return;
      fToast.showToast(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colors.background,
            border: Border.all(color: colors.border),
          ),
          child: Text(
            next,
            style: TextStyle(
              color: colors.foreground,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        gravity: ToastGravity.BOTTOM,
      );
    });
    return child;
  }
}
