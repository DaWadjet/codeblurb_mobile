import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeblurbLogo extends HookWidget {
  const CodeblurbLogo({super.key, this.scale = 1});

  final double scale;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.terminal.svg(
          // ignore: deprecated_member_use_from_same_package
          color: colors.primary,
          width: 48.h * scale,
          height: 48.h * scale,
        ),
        Text(
          'CodeBlurb',
          style: TextStyle(
            fontSize: 36.sp * scale,
            letterSpacing: -0.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
