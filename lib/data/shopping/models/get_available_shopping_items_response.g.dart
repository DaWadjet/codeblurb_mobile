// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_available_shopping_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAvailableShoppingItemsResponse _$GetAvailableShoppingItemsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAvailableShoppingItemsResponse(
      (json['shoppingItems'] as List<dynamic>)
          .map((e) => ShoppingItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
