import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/widgets/tappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScrollableView<T> extends HookWidget {
  const ScrollableView({
    required this.items,
    required this.title,
    required this.ctor,
    required this.onViewAll,
    super.key,
  });

  final List<T> items;
  final Widget Function(T) ctor;
  final String title;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    if (items.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Tappable(
                onTap: onViewAll,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      const Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 4),
                      RotatedBox(
                        quarterTurns: -1,
                        child: Assets.images.chevronDown.svg(
                          width: 20,
                          height: 20,
                          // ignore: deprecated_member_use_from_same_package
                          color: colors.foreground,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 256,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...[
                ...items,
                ...items,
              ].take(3).map(
                    ctor,
                  ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
