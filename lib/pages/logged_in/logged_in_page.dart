import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/widgets/platform_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LoggedInPage extends ConsumerWidget {
  const LoggedInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isLoggedInProvider);
    final payments = ref.watch(paymentsQueryProvider);
    log(isLoggedIn.toString());

    ref.listen(sessionErrorProvider, (previous, next) {
      showDialog<void>(
        context: context,
        builder: (_) => PlatformDialog(
          title: 'Session expired',
          onTap: () =>
              ref.read(isLoggedInProvider.notifier).setLoggedIn(value: false),
        ),
      );
    });
    return const AutoRouter();
  }
}
