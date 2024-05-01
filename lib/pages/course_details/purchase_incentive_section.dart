import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_provider.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:codeblurb_mobile/widgets/price_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PurchaseIncentiveSection extends HookConsumerWidget {
  const PurchaseIncentiveSection({
    required this.courseId,
    required this.price,
    super.key,
  });

  final int courseId;
  final double price;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomPadding = context.bottomPadding;

    final cart = ref.watch(shoppingCartQueryProvider);
    final cartProviderState = ref.watch(shoppingCartNotifierProvider);

    final isItemInCart = useMemoized(
      () {
        return cart.maybeWhen(
          data: (data) => data.shoppingItems.any(
            (element) => element.id == courseId,
          ),
          orElse: () => false,
        );
      },
      [cart],
    );
    return Column(
      children: [
        const Divider(),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              PriceTag(
                discount: true,
                originalPrice: price,
                isBig: true,
              ),
              const Spacer(),
              HookConsumer(
                builder: (context, ref, _) {
                  return SizedBox(
                    height: 48,
                    width: 156,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (cartProviderState.isLoading) return;
                        if (isItemInCart) {
                          await context.router.push(
                            const ShoppingCartRoute(),
                          );
                        } else {
                          unawaited(
                            ref
                                .read(
                                  shoppingCartNotifierProvider.notifier,
                                )
                                .addItemToCart(courseId),
                          );
                        }
                      },
                      child: isItemInCart
                          ? const Text(
                              'View Cart',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : cartProviderState.maybeWhen(
                              data: (data) {
                                if (data == courseId) {
                                  return const Loader(
                                    size: 32,
                                    withBackgroundColor: true,
                                  );
                                } else {
                                  return const Text(
                                    'Add To Cart',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                }
                              },
                              orElse: () => const Text(
                                'Add To Cart',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: bottomPadding + 16,
        ),
      ],
    );
  }
}
