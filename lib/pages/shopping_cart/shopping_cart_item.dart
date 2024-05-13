import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/network/models/shopping_item_response.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_provider.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/widgets/brief_info.dart';
import 'package:codeblurb_mobile/widgets/course_image.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:codeblurb_mobile/widgets/price_tag.dart';
import 'package:codeblurb_mobile/widgets/small_rating_view.dart';
import 'package:codeblurb_mobile/widgets/tappable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShoppingCartItem extends HookConsumerWidget {
  const ShoppingCartItem({required this.item, super.key});
  final ShoppingItemResponse item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullWidth = MediaQuery.of(context).size.width;

    final loadingState = ref.watch(shoppingCartNotifierProvider);

    final colors = useColors();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: colors.background,
        border: Border(
          bottom: BorderSide(
            color: colors.border,
          ),
        ),
      ),
      child: Tappable(
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
                  CourseImage(
                    imageUrl: item.contentBundle.imageUrl,
                    height: 112,
                    width: fullWidth * 0.3,
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
                          BriefInfo(
                            skillLevel: item.contentBundle.skillLevel,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SmallRatingView(ratings: item.ratings),
                              const Spacer(),
                              PriceTag(
                                originalPrice: item.price,
                              ),
                              const SizedBox(width: 8),
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
                                  // ignore: lines_longer_than_80_chars
                                  'By pressing Ok, you will remove this item from your cart.',
                              onConfirm: () => ref
                                  .read(
                                    shoppingCartNotifierProvider.notifier,
                                  )
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
    );
  }
}
