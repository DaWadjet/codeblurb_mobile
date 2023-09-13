// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingCartResponse _$ShoppingCartResponseFromJson(
        Map<String, dynamic> json) =>
    ShoppingCartResponse(
      (json['shoppingItems'] as List<dynamic>)
          .map((e) => ShoppingItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
