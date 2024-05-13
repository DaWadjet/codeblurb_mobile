import 'package:codeblurb_mobile/generated/assets.gen.dart';
import 'package:codeblurb_mobile/hooks/use_colors.dart';
import 'package:codeblurb_mobile/pages/shopping_cart/shopping_cart_provider.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:codeblurb_mobile/test/keys.dart';
import 'package:codeblurb_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartButton extends HookConsumerWidget {
  const CartButton({required this.bundleId, super.key});

  final int bundleId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(shoppingCartQueryProvider);
    final cartProviderState = ref.watch(shoppingCartNotifierProvider);

    final isItemInCart = useMemoized(
      () {
        return cart.maybeWhen(
          data: (data) => data.shoppingItems.any(
            (element) => element.id == bundleId,
          ),
          orElse: () => false,
        );
      },
      [cart],
    );
    final colors = useColors();
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colors.border,
          width: 1.5,
        ),
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        onPressed: () {
          if (isItemInCart) {
            ref.read(alertDialogNotifierProvider.notifier).showAreYouSureDialog(
                  title: 'Are you sure?',
                  message:
                      // ignore: lines_longer_than_80_chars
                      'By pressing Ok, you will remove this item from your cart.',
                  onConfirm: () => ref
                      .read(
                        shoppingCartNotifierProvider.notifier,
                      )
                      .removeItemFromCart(bundleId),
                );
          } else {
            ref
                .read(shoppingCartNotifierProvider.notifier)
                .addItemToCart(bundleId);
          }
        },
        icon: cartProviderState.maybeWhen(
          data: (data) {
            if (data == bundleId) {
              return const Loader(
                size: 32,
              );
            } else {
              if (isItemInCart) {
                return Assets.images.x.svg(
                  key: Keys.cartRemove,
                  // ignore: deprecated_member_use_from_same_package
                  color: colors.foreground,
                  height: 24,
                  width: 24,
                );
              } else {
                return Assets.images.shoppingCart.svg(
                  key: Keys.cartAdd,
                  // ignore: deprecated_member_use_from_same_package
                  color: colors.foreground,
                  height: 24,
                  width: 24,
                );
              }
            }
          },
          orElse: () => const SizedBox(),
        ),
      ),
    );
  }
}
