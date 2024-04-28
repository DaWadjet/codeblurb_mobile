import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController();
    final colors = useColors();
    final route = useState<PageRouteInfo?>(null);
    final isAnimationFinished = useState(false);

    useEffect(
      () {
        animationController.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            isAnimationFinished.value = true;
          }
        });
        return null;
      },
      [],
    );

    ref.listen(refreshTokenProvider, (previous, next) {
      if (next.hasValue) {
        if (next.value!) {
          route.value = const TabsRoute();
        } else {
          route.value = const LoginRoute();
        }
      }
    });

    useEffect(
      () {
        debugPrint(route.value.toString());
        debugPrint(isAnimationFinished.value.toString());
        if (route.value != null && isAnimationFinished.value) {
          context.replaceRoute(route.value!);
        }
        return null;
      },
      [isAnimationFinished.value, route.value],
    );

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.terminal.svg(
              // ignore: deprecated_member_use_from_same_package
              color: colors.primary,
              width: 48,
              height: 48,
            ),
            const Text(
              'CodeBlurb',
              style: TextStyle(
                fontSize: 36,
                letterSpacing: -0.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
            .animate(controller: animationController)
            .fadeIn(
              duration: 200.ms,
            )
            .scale(
              duration: 800.ms,
              begin: const Offset(0.92, 0.92),
            )
            .then()
            .fadeOut(duration: 200.ms),
      ),
    );
  }
}
