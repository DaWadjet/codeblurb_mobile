import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Loader extends HookWidget {
  const Loader({
    super.key,
    this.size = 24,
    this.withBackgroundColor = false,
  });

  final double size;
  final bool withBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();

    return Assets.images.loader
        .svg(
          width: size,
          height: size,
          // ignore: deprecated_member_use_from_same_package
          color: withBackgroundColor ? colors.background : colors.foreground,
        )
        .animate(onPlay: (controller) => controller.repeat())
        .rotate(duration: 1.seconds);
  }
}
