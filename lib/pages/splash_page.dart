import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/widgets/logo.dart';
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
          route.value = const LoggedInRoute();
        } else {
          route.value = LoginRoute();
        }
      }
    });

    useEffect(
      () {
        if (route.value != null && isAnimationFinished.value) {
          context.router.replaceAll([route.value!]);
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
            const CodeblurbLogo(
              scale: 1.25,
            )
                .animate(controller: animationController)
                .fadeIn(
                  duration: 200.ms,
                )
                .scale(
                  duration: 800.ms,
                  begin: const Offset(0.96, 0.96),
                )
                .then()
                .fadeOut(duration: 200.ms),
          ],
        ),
      ),
    );
  }
}
