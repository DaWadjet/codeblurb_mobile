import 'dart:math';

import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/pages/content/drag_and_drop_content/drag_and_drop_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DraggableItem extends HookWidget {
  const DraggableItem({
    required this.answer,
    this.index = -1,
    super.key,
  });

  final String answer;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    final child = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colors.border,
          width: 1.5,
        ),
      ),
      width: 80 + max(0, answer.length - 5) * 11,
      child: Text(
        answer,
        style: const TextStyle(
          fontSize: 16,
          letterSpacing: 1,
          fontFamily: 'monospace',
        ),
      ),
    );

    return Draggable<DragProps>(
      data: DragProps(
        answer,
        index,
      ),
      childWhenDragging: Opacity(
        opacity: 0.7,
        child: child,
      ),
      feedback: Material(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: colors.ring,
              width: 2,
            ),
          ),
          width: 80 + max(0, answer.length - 5) * 12,
          child: Text(
            answer,
            style: const TextStyle(
              fontSize: 16,
              letterSpacing: 1,
              fontFamily: 'monospace',
            ),
          ),
        ),
      ),
      child: child,
    );
  }
}
