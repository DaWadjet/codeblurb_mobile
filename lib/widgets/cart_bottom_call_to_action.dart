import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_provider.dart';
import 'package:codeblurb_mobile/routes/app_router.dart';
import 'package:codeblurb_mobile/test/keys.dart';
import 'package:codeblurb_mobile/widgets/bottom_call_to_action.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartBottomCallToAction extends HookConsumerWidget {
  const CartBottomCallToAction({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(shoppingCartQueryProvider);
    final bottomPadding = context.bottomPadding;

    return cart.maybeWhen(
      orElse: () => const SizedBox(),
      data: (data) => BottomCallToAction(
        key: Keys.cartCta,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: data.shoppingItems.isEmpty
              ? const SizedBox(
                  key: ValueKey('empty'),
                )
              : Column(
                  key: const ValueKey('total'),
                  children: [
                    const Divider(),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Total price',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '\$${data.shoppingItems.fold(
                                      0.toDouble(),
                                      (previousValue, element) =>
                                          previousValue + element.price,
                                    ).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 44,
                            child: ElevatedButton(
                              key: Keys.viewCart,
                              onPressed: () {
                                context.router.replaceAll(
                                  [
                                    const ShoppingCartRoute(),
                                  ],
                                );
                              },
                              child: const Text(
                                'View Cart',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: bottomPadding,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
