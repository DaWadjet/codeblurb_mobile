import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/hooks/use_content_type.dart';
import 'package:codeblurb_mobile/types.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NextUpSection extends HookConsumerWidget {
  const NextUpSection({required this.nextUp, super.key});

  final Section nextUp;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomPadding = context.bottomPadding;
    final colors = useColors();

    final (routeBuilder, _) = useContentType(
      contentType: nextUp.contentType,
      codingContentType: nextUp.codingContentType,
    );

    return Column(
      key: const ValueKey('nextUp'),
      children: [
        const Divider(),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Next Up',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    nextUp.name,
                    style: TextStyle(
                      fontSize: 14,
                      color: colors.mutedForeground,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    if (routeBuilder != null) {
                      context.router.push(
                        routeBuilder(
                          nextUp,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: bottomPadding,
        ),
      ],
    );
  }
}
