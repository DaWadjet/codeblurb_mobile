import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/shopping_item_response.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_item.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/widgets/cart_button.dart';
import 'package:codeblurb_mobile/widgets/price_tag.dart';
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
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Material(
              child: InkWell(
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
                        CachedNetworkImage(
                          imageUrl: content.contentBundle.imageUrl ?? dummyUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 122,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
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
                                Text(
                                  'Java - ${content.contentBundle.skillLevel.value}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: colors.mutedForeground,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      content
                                          .contentBundle.ratings.averageRating
                                          .toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Assets.images.star.svg(
                                      // ignore: deprecated_member_use_from_same_package
                                      color: Colors.amber,
                                      width: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '(${content.contentBundle.ratings.numberOfRatings})',
                                      style: TextStyle(
                                        fontSize: 14,
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
