import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/extensions/build_context_extensions.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_item.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_provider.dart';
import 'package:codeblurb_mobile/widgets/adaptive_pull_to_refresh.dart';
import 'package:codeblurb_mobile/widgets/bottom_call_to_action.dart';
import 'package:codeblurb_mobile/widgets/cb_app_bar.dart';
import 'package:codeblurb_mobile/widgets/full_page_message.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ShoppingCartPage extends HookConsumerWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(shoppingCartQueryProvider);

    final bottomPadding = context.bottomPadding;

    return Scaffold(
      appBar: const CBAppBar(
        title: 'Shopping Cart',
      ),
      body: Stack(
        children: [
          AdaptivePullToRefresh(
            onRefresh: ref.watch(shoppingCartNotifierProvider.notifier).refresh,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: cart.when(
                data: (data) {
                  if (data.shoppingItems.isEmpty) {
                    return const FullPageMessage(message: 'Your cart is empty');
                  }
                  return Column(
                    children: [
                      ...[...data.shoppingItems, ...data.shoppingItems].map(
                        (item) => ShoppingCartItem(item: item),
                      ),
                      SizedBox(height: 100 + bottomPadding),
                    ],
                  );
                },
                error: FullPageError.new,
                loading: FullPageLoader.new,
              ),
            ),
          ),
          BottomCallToAction(
            child: cart.maybeWhen(
              orElse: () => const SizedBox(),
              data: (data) => AnimatedSwitcher(
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
                            height: 8,
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
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //TODO: Implement checkout
                                    },
                                    child: const Text(
                                      'Checkout',
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
          ),
        ],
      ),
    );
  }
}
