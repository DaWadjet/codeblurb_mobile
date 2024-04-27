import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Assets.images.hourglass
                // ignore: deprecated_member_use_from_same_package
                .svg(width: 100, height: 100, color: colors.foreground),
            const Text('HomePage'),
          ],
        ),
      ),
    );
  }
}
