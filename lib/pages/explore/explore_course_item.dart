import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/network/models/shopping_item_response.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/widgets/brief_info.dart';
import 'package:codeblurb_mobile/widgets/cart_button.dart';
import 'package:codeblurb_mobile/widgets/course_image.dart';
import 'package:codeblurb_mobile/widgets/price_tag.dart';
import 'package:codeblurb_mobile/widgets/small_rating_view.dart';
import 'package:codeblurb_mobile/widgets/tappable.dart';
import 'package:flutter/material.dart';

class ExploreCourseItem extends StatelessWidget {
  const ExploreCourseItem({required this.content, super.key});

  final ShoppingItemResponse content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Tappable(
        onTap: () => context.router.push(
          PurchasedCourseDetailsRoute(
            courseId: content.id,
          ),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: 122,
              child: Row(
                children: [
                  CourseImage(
                    imageUrl: content.contentBundle.imageUrl,
                    height: 122,
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
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              content.title,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Spacer(),
                          BriefInfo(
                            skillLevel: content.contentBundle.skillLevel,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SmallRatingView(
                                ratings: content.contentBundle.ratings,
                              ),
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
            Positioned(
              top: 2,
              right: 2,
              child: CartButton(bundleId: content.id),
            ),
          ],
        ),
      ),
    );
  }
}
