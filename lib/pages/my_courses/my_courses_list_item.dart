import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/minimal_content_bundle_response.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_item.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/widgets/app_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyCoursesListItem extends HookWidget {
  const MyCoursesListItem({required this.content, super.key});

  final MinimalContentBundleResponse content;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          child: InkWell(
            onTap: () => context.router.push(
              PurchasedCourseDetailsRoute(
                courseId: content.id,
              ),
            ),
            child: SizedBox(
              height: 122,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: content.imageUrl ?? dummyUrl,
                      fit: BoxFit.cover,
                      height: 122,
                      width: 122,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            content.title,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Java - ${content.skillLevel.value}',
                            style: TextStyle(
                              fontSize: 12,
                              color: colors.mutedForeground,
                            ),
                          ),
                          const SizedBox(height: 8),
                          AppProgressBar(
                            progress: content.progress ?? 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
