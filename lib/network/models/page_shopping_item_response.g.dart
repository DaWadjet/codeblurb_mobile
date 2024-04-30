// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_shopping_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedShoppingItemsResponse _$PagedShoppingItemsResponseFromJson(
        Map<String, dynamic> json) =>
    PagedShoppingItemsResponse(
      json['number'] as int,
      json['last'] as bool,
      json['first'] as bool,
      json['totalPages'] as int,
      json['size'] as int,
      json['numberOfElements'] as int,
      json['totalElements'] as int,
      (json['content'] as List<dynamic>)
          .map((e) => ShoppingItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
