import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_item.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_provider.dart';
import 'package:codeblurb_mobile/widgets/adaptive_pull_to_refresh.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ShoppingCartPage extends HookConsumerWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(shoppingCartQueryProvider);
    final fullHeight = MediaQuery.of(context).size.height;
    final colors = useColors();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        forceMaterialTransparency: true,
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
                    return Padding(
                      padding: EdgeInsets.only(top: fullHeight / 3),
                      key: const ValueKey('empty'),
                      child: const Center(
                        child: Text('Your cart is empty'),
                      ),
                    );
                  }
                  return Column(
                    children: [
                      ...data.shoppingItems.map(
                        (item) => ShoppingCartItem(item: item),
                      ),
                      const SizedBox(height: 100),
                    ],
                  );
                },
                error: (e, stackTrace) => Padding(
                  padding: EdgeInsets.only(top: fullHeight / 3),
                  child: const Center(
                    key: ValueKey('error'),
                    child: Text('An error occurred\nPlease try again later'),
                  ),
                ),
                loading: () => Padding(
                  padding: EdgeInsets.only(top: fullHeight / 3),
                  child: const Center(
                    key: ValueKey('loading'),
                    child: Loader(
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: cart.maybeWhen(
              orElse: () => const SizedBox(),
              data: (data) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: data.shoppingItems.isEmpty
                    ? const SizedBox(
                        key: ValueKey('empty'),
                      )
                    : ColoredBox(
                        key: const ValueKey('total'),
                        color: colors.background,
                        child: Column(
                          children: [
                            const Divider(),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        )}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      //TODO: Implement checkout
                                    },
                                    child: const Text('Checkout'),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ).animate().slideY().fadeIn(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
