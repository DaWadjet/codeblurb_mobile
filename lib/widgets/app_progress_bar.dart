import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppProgressBar extends HookWidget {
  const AppProgressBar({
    required this.progress,
    this.withText = true,
    this.height = 8,
    super.key,
  });

  final double progress;
  final bool withText;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutSine,
      tween: Tween<double>(begin: 0, end: progress.clamp(0, 1)),
      builder: (_, value, child) {
        final percentage = value * 100;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height,
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(8),
                value: value,
                backgroundColor: colors.muted,
                valueColor: AlwaysStoppedAnimation(colors.accentForeground),
              ),
            ),
            if (withText) ...[
              const SizedBox(height: 6),
              Text(
                percentage == 0
                    ? 'Start learning'
                    : percentage < 100
                        ? '${percentage.toStringAsFixed(0)}% completed'
                        : 'Completed',
                style: TextStyle(
                  fontSize: 12,
                  color: colors.mutedForeground,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
