import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/shopping_item_response.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_provider.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:codeblurb_mobile/widgets/price_tag.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO replace
const dummyUrl = 'https://fireship.io/courses/js/img/featured.webp';

class ShoppingCartItem extends HookConsumerWidget {
  const ShoppingCartItem({required this.item, super.key});
  final ShoppingItemResponse item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullWidth = MediaQuery.of(context).size.width;

    final loadingState = ref.watch(shoppingCartNotifierProvider);

    final colors = useColors();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          child: InkWell(
            onTap: () => context.router.push(
              CourseDetailsRoute(
                courseId: item.id,
              ),
            ),
            child: SizedBox(
              height: 112,
              child: Stack(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: item.contentBundle.imageUrl ?? dummyUrl,
                          fit: BoxFit.cover,
                          height: 112,
                          width: fullWidth * 0.3,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            16,
                            4,
                            0,
                            4,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 32,
                                ),
                                child: Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  item.contentBundle.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'Java - ${item.contentBundle.skillLevel.value}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: colors.mutedForeground,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    item.ratings.averageRating
                                        .toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontSize: 18,
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
                                    '(${item.ratings.numberOfRatings})',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: colors.mutedForeground,
                                    ),
                                  ),
                                  const Spacer(),
                                  PriceTag(
                                    originalPrice: item.price,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: -8,
                    top: -8,
                    child: loadingState.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      data: (data) {
                        return IconButton(
                          icon: data == item.id
                              ? const Loader()
                              : Assets.images.x.svg(
                                  width: 24,
                                  // ignore: deprecated_member_use_from_same_package
                                  color: colors.foreground,
                                ),
                          onPressed: () {
                            ref
                                .read(alertDialogNotifierProvider.notifier)
                                .showAreYouSureDialog(
                                  title: 'Are you sure?',
                                  message:
                                      'By pressing Ok, you will remove this item from your cart.',
                                  onConfirm: () => ref
                                      .read(
                                          shoppingCartNotifierProvider.notifier)
                                      .removeItemFromCart(item.id),
                                );
                          },
                        );
                      },
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
