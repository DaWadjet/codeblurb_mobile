import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BottomCallToAction extends HookWidget {
  const BottomCallToAction({
    required this.child,
    super.key,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ColoredBox(
        color: colors.background,
        child: child,
      )
          .animate()
          .slideY(
            curve: Curves.easeInOut,
            begin: 1,
            end: 0,
          )
          .fadeIn(),
    );
  }
}
