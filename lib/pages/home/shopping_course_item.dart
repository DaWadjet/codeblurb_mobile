import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/shopping_item_response.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/widgets/brief_info.dart';
import 'package:codeblurb_mobile/widgets/cart_button.dart';
import 'package:codeblurb_mobile/widgets/course_image.dart';
import 'package:codeblurb_mobile/widgets/price_tag.dart';
import 'package:codeblurb_mobile/widgets/small_rating_view.dart';
import 'package:codeblurb_mobile/widgets/tappable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShoppingCourseItem extends HookConsumerWidget {
  const ShoppingCourseItem(this.content, {super.key});

  final ShoppingItemResponse content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useColors();
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Stack(
        children: [
          Tappable(
            borderRadius: 12,
            onTap: () => context.router.push(
              CourseDetailsRoute(
                courseId: content.id,
              ),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colors.border,
                  ),
                ),
                child: Column(
                  children: [
                    CourseImage(
                      imageUrl: content.contentBundle.imageUrl,
                      withBorderRadius: false,
                      width: double.infinity,
                      height: 122,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              content.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            BriefInfo(
                              skillLevel: content.contentBundle.skillLevel,
                            ),
                            const SizedBox(height: 6),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SmallRatingView(ratings: content.ratings),
                                const Spacer(),
                                PriceTag(
                                  originalPrice: content.price,
                                ),
                              ],
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
          Positioned(
            top: 8,
            right: 8,
            child: CartButton(bundleId: content.id),
          ),
        ],
      ),
    );
  }
}
