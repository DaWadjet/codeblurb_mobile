import 'package:codeblurb_mobile/network/models/shopping_cart_response.dart';
import 'package:codeblurb_mobile/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_cart_provider.g.dart';

@riverpod
Future<ShoppingCartResponse> shoppingCartQuery(ShoppingCartQueryRef ref) async {
  loggedInGuard(ref);
  return ref
      .watch(
        shoppingRepositoryProvider,
      )
      .getCart();
}

@riverpod
class ShoppingCartNotifier extends _$ShoppingCartNotifier {
  @override
  AsyncValue<int?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> refresh() async {
    try {
      ref.invalidate(shoppingCartQueryProvider);
    } catch (e) {
      ref.read(toastNotifierProvider.notifier).showToast(
            'Failed to refresh shopping cart',
          );
    }
  }

  Future<void> addItemToCart(int courseId) async {
    state = AsyncData(courseId);
    try {
      await ref
          .watch(
            shoppingRepositoryProvider,
          )
          .addItemToCart(shoppingCartItemId: courseId);
      final _ = await ref.refresh(shoppingCartQueryProvider.future);
    } catch (e) {
      ref
          .read(toastNotifierProvider.notifier)
          .showToast('Failed to add item to cart');
    } finally {
      state = const AsyncData(null);
    }
  }

  Future<void> removeItemFromCart(int courseId) async {
    state = AsyncData(courseId);

    try {
      await ref
          .watch(
            shoppingRepositoryProvider,
          )
          .removeItemFromCart(shoppingCartItemId: courseId);
      final _ = await ref.refresh(shoppingCartQueryProvider.future);
    } catch (e) {
      ref
          .read(toastNotifierProvider.notifier)
          .showToast('Failed to remove item from cart');
    } finally {
      state = const AsyncData(null);
    }
  }
}
