import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/shopping_item_response.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_item.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/widgets/brief_info.dart';
import 'package:codeblurb_mobile/widgets/cart_button.dart';
import 'package:codeblurb_mobile/widgets/price_tag.dart';
import 'package:codeblurb_mobile/widgets/tappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExploreCourseItem extends HookWidget {
  const ExploreCourseItem({required this.content, super.key});

  final ShoppingItemResponse content;

  @override
  Widget build(BuildContext context) {
    final colors = useColors();
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: content.contentBundle.imageUrl ?? dummyUrl,
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
                              Text(
                                content.contentBundle.ratings.averageRating
                                    .toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Assets.images.starFilled.svg(
                                // ignore: deprecated_member_use_from_same_package
                                color: Colors.amber,
                                width: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                // ignore: lines_longer_than_80_chars
                                '(${content.contentBundle.ratings.numberOfRatings})',
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1,
                                  color: colors.mutedForeground,
                                ),
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
