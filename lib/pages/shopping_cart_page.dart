import 'package:auto_route/auto_route.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ShoppingCartPage extends HookConsumerWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(shoppingCartQueryProvider);

    return const Scaffold(
      body: Center(
        child: Text('ShoppingCartPage'),
      ),
    );
  }
}
