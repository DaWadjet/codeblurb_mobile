import 'package:codeblurb_mobile/network/models/page_shopping_item_response.dart';
import 'package:codeblurb_mobile/network/models/shopping_cart_response.dart';
import 'package:codeblurb_mobile/network/models/shopping_item_response.dart';
import 'package:codeblurb_mobile/network/shopping/shopping_api.dart';
import 'package:codeblurb_mobile/utils/page_props.dart';

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

  Future<PagedShoppingItemsResponse> getAvailableShoppingItems(
    PageProps? params,
  ) async {
    final response = await _shoppingApi
        .getAvailableShoppingItems(params?.toQueryParameters());
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
