import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/hooks/use_content_type.dart';
import 'package:codeblurb_mobile/network/models/minimal_content_response.dart';
import 'package:codeblurb_mobile/network/models/seen_status.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CourseSectionItem extends HookConsumerWidget {
  const CourseSectionItem({
    required this.section,
    super.key,
  });

  final MinimalContentResponse section;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();
    final (_, icon) = useContentType(
      contentType: section.contentType,
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
              bottom: 16,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      section.shortDescription,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '${section.estimatedTime} min',
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
