import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/hooks/use_content_type.dart';
import 'package:codeblurb_mobile/network/models/seen_status.dart';
import 'package:codeblurb_mobile/types.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CourseSectionItem extends HookConsumerWidget {
  const CourseSectionItem({
    required this.section,
    this.canNavigate = false,
    super.key,
  });

  final Section section;
  final bool canNavigate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();
    final (routeBuilder, icon) = useContentType(
      contentType: section.contentType,
      codingContentType: section.codingContentType,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        //TODO might need to change these
        child: Card(
          color: section.status == SeenStatus.seen
              ? colors.mutedForeground.withOpacity(0.05)
              : section.status == SeenStatus.completed
                  ? colors.mutedForeground.withOpacity(0.15)
                  : Colors.transparent,
          margin: EdgeInsets.zero,
          child: ExpansionTile(
            childrenPadding: const EdgeInsets.only(
              left: 16,
              right: 24,
              bottom: 12,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  section.name,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                icon.svg(
                  width: 24,
                  height: 24,
                  // ignore: deprecated_member_use_from_same_package
                  color: colors.foreground,
                ),
              ],
            ),
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Text(
                      section.shortDescription,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${section.estimatedTime} min',
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              if (canNavigate) ...[
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const Spacer(),
                    OutlinedButton(
                      onPressed: () {
                        if (routeBuilder != null) {
                          context.router.push(routeBuilder(section));
                        }
                      },
                      child: const Text('Start'),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
