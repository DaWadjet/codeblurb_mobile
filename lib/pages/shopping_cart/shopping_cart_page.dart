import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_item.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_provider.dart';
import 'package:codeblurb_mobile/widgets/adaptive_pull_to_refresh.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ShoppingCartPage extends HookConsumerWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(shoppingCartQueryProvider);
    final fullHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        forceMaterialTransparency: true,
      ),
      body: AdaptivePullToRefresh(
        onRefresh: ref.read(shoppingCartNotifierProvider.notifier).refresh,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: cart.whenOrNull(
            skipError: true,
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
                children: data.shoppingItems
                    .map(
                      (item) => ShoppingCartItem(item: item),
                    )
                    .toList(),
              );
            },
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
    );
  }
}
