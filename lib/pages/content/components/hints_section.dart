import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HintsSecton extends HookConsumerWidget {
  const HintsSecton({
    required this.hints,
    required this.onShowHints,
    required this.shownHintCount,
    super.key,
  });

  final List<String> hints;
  final VoidCallback onShowHints;
  final int shownHintCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();
    if (hints.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        if (shownHintCount == 0)
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Text(
                  'Need some help?',
                  style: TextStyle(
                    fontSize: 16,
                    color: colors.mutedForeground,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: onShowHints,
                  child: const Text('Show hint'),
                ),
              ],
            ),
          )
        else ...[
          SizedBox(
            height: 40,
            child: Row(
              children: [
                const Text(
                  'Hints',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                if (shownHintCount < hints.length)
                  TextButton(
                    onPressed: onShowHints,
                    child: const Text('Show more'),
                  ),
              ],
            ),
          ),
          for (var i = 0; i < shownHintCount; i++)
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  children: [
                    Assets.images.wandSparkles.svg(
                      width: 24,
                      height: 24,
                      // ignore: deprecated_member_use_from_same_package
                      color: colors.foreground,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        hints[i],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ],
    );
  }
}
