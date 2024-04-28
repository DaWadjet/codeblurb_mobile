import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/link.dart';
import 'package:codeblurb_mobile/pages/login/login_provider.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginNotifierProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('LoginPage'),
            state.when(
              data: (data) => Text('Data: $data'),
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Error: $error'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(loginNotifierProvider.notifier).login();
              },
              child: const Text('Login'),
            ),
            const Link(route: TabsRoute()),
            const Link(route: RegisterRoute()),
            const Link(route: RequestNewPasswordRoute()),
          ],
        ),
      ),
    );
  }
}
