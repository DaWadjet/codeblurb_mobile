import 'package:codeblurb_mobile/data/shopping/models/get_available_shopping_items_response.dart';
import 'package:codeblurb_mobile/data/shopping/models/shopping_cart_response.dart';
import 'package:codeblurb_mobile/data/shopping/shopping_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoppingRepoProvider = Provider<ShoppingRepository>(
  (ref) => ShoppingRepository(ref.watch(shoppingApiProvider)),
  name: 'Shopping Repository Provider',
);

class ShoppingRepository {
  ShoppingRepository(this._shoppingApi);
  final ShoppingApi _shoppingApi;

  Future<ShoppingCartResponse> addItemToCart({
    required int shoppingCartItemId,
  }) async {
    final response =
        await _shoppingApi.addItem(shoppingCartItemId: shoppingCartItemId);
    return ShoppingCartResponse.fromJson(response.data!);
  }

  Future<ShoppingCartResponse> restoreShoppingCart() async {
    final response = await _shoppingApi.restoreShoppingCart();
    return ShoppingCartResponse.fromJson(response.data!);
  }

  Future<GetAvailableShoppingItemsResponse> getAvailableShoppingItems() async {
    final response = await _shoppingApi.getAvailableShoppingItems();
    return GetAvailableShoppingItemsResponse.fromJson(response.data!);
  }

  Future<ShoppingCartResponse> removeItemFromCart({
    required int shoppingCartItemId,
  }) async {
    final response = await _shoppingApi.removeItemFromCart(
      shoppingCartItemId: shoppingCartItemId,
    );
    return ShoppingCartResponse.fromJson(response.data!);
  }
}
