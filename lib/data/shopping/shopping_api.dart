import 'package:codeblurb_mobile/core/network/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoppingApiProvider = Provider<ShoppingApi>(
  (ref) => ShoppingApi(ref.watch(dioProvider)),
  name: 'Shopping API Provider',
);

class ShoppingApi {
  ShoppingApi(this._dio);

  final Dio _dio;

  Future<Response<Map<String, dynamic>>> addItem(
      {required int shoppingCartItemId,}) async {
    return _dio.post('/shopping/add-item/$shoppingCartItemId');
  }

  Future<Response<Map<String, dynamic>>> restoreShoppingCart() async {
    return _dio.get('/shopping/restore-shopping-cart');
  }

  Future<Response<Map<String, dynamic>>> getAvailableShoppingItems() async {
    return _dio.get('/shopping/available-shopping-items');
  }

  Future<Response<Map<String, dynamic>>> removeItemFromCart(
      {required int shoppingCartItemId,}) async {
    return _dio.delete('/shopping/delete-item/$shoppingCartItemId');
  }
}
