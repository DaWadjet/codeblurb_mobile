import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        Future.delayed(
          const Duration(milliseconds: 1000),
          () => context.router.replace(const LoginRoute()),
        );
        return null;
      },
      [],
    ); // useEffect hook
    return const Scaffold(
      body: Center(
        child: Text('SplashPage'),
      ),
    );
  }
}
