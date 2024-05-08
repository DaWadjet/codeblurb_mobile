import 'dart:math';

import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/pages/content/drag_and_drop_content/drag_and_drop_provider.dart';
import 'package:codeblurb_mobile/pages/content/drag_and_drop_content/draggable_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnswerSlot extends HookConsumerWidget {
  const AnswerSlot({
    required this.answer,
    required this.index,
    super.key,
  });

  final String answer;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();

    final borderColor = ref.watch(
      dragAndDropNotifierProvider.select((state) {
        return state.solution?.incorrectSolutions.any(
                  (s) => s.incorrectSolutionIndex == index,
                ) ??
                false
            ? colors.destructive
            : state.solution?.correctAnswerIndices.contains(index) ?? false
                ? Colors.green[600]
                : null;
      }),
    );

    return DragTarget<DragProps>(
      builder: (
        BuildContext context,
        List<DragProps?> incoming,
        List<dynamic> rejected,
      ) {
        if (answer.isEmpty) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: incoming.isEmpty
                  ? borderColor != null
                      ? Border.all(
                          color: borderColor,
                          width: 2,
                        )
                      : Border.all(
                          color: colors.border,
                          width: 1.5,
                        )
                  : Border.all(
                      color: colors.ring,
                      width: 2,
                    ),
            ),
            width: 80 + max(0, answer.length - 5) * 12,
            child: const Text(
              '...',
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 1,
                fontFamily: 'monospace',
              ),
            ),
          );
        } else {
          return Container(
            decoration: incoming.isNotEmpty || borderColor != null
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: borderColor ?? colors.ring,
                      width: 2,
                    ),
                  )
                : null,
            margin: incoming.isNotEmpty || borderColor != null
                ? const EdgeInsets.all(2)
                : null,
            child: DraggableItem(answer: answer, index: index),
          );
        }
      },
      onWillAcceptWithDetails: (data) => data.data.fromIndex != index,
      onAcceptWithDetails: (data) {
        ref.read(dragAndDropNotifierProvider.notifier).changeAnswerAtIndex(
              fromIndex: data.data.fromIndex,
              targetIndex: index,
              answer: data.data.answer,
            );
      },
      onLeave: (data) {},
    );
  }
}
