import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/link.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LoginPage'),
            Link(route: TabsRoute()),
            Link(route: RegisterRoute()),
            Link(route: RequestNewPasswordRoute()),
          ],
        ),
      ),
    );
  }
}
