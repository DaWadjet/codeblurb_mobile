import 'package:codeblurb_mobile/core/network/models/page_shopping_item_response.dart';
import 'package:codeblurb_mobile/core/network/models/shopping_cart_response.dart';
import 'package:codeblurb_mobile/core/network/models/shopping_item_response.dart';
import 'package:codeblurb_mobile/core/network/shopping/shopping_api.dart';
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

  Future<ShoppingCartResponse> getCart() async {
    final response = await _shoppingApi.getShoppingCart();
    return ShoppingCartResponse.fromJson(response.data!);
  }

  Future<ShoppingItemResponse> getShoppingItem(int id) async {
    final response = await _shoppingApi.getShoppingItem(id);
    return ShoppingItemResponse.fromJson(response.data!);
  }

//TODO wire in paging logic
  Future<PagedShoppingItemsResponse> getAvailableShoppingItems() async {
    final response = await _shoppingApi.getAvailableShoppingItems();
    return PagedShoppingItemsResponse.fromJson(response.data!);
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
