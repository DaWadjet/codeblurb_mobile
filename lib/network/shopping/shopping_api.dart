import 'package:codeblurb_mobile/types.dart';
import 'package:dio/dio.dart';

class ShoppingApi {
  ShoppingApi(this._dio);
  final Dio _dio;

  ApiResponse addItem({
    required int shoppingCartItemId,
  }) async {
    return _dio.post('/shopping/add-item/$shoppingCartItemId');
  }

  ApiResponse getShoppingCart() async {
    return _dio.get('/shopping/shopping-cart');
  }

//TODO add paging and filtering
  ApiResponse getAvailableShoppingItems() async {
    return _dio.get('/shopping/available-shopping-items');
  }

  ApiResponse getShoppingItem(int itemId) async {
    return _dio.get('/shopping/shopping-item/$itemId');
  }

  ApiResponse removeItemFromCart({
    required int shoppingCartItemId,
  }) async {
    return _dio.delete('/shopping/delete-item/$shoppingCartItemId');
  }
}
