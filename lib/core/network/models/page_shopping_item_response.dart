// ignore_for_file: avoid_positional_boolean_parameters

import 'package:codeblurb_mobile/core/network/models/shopping_item_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_shopping_item_response.g.dart';

@JsonSerializable(createToJson: false)
class PagedShoppingItemsResponse {
  PagedShoppingItemsResponse(
    this.number,
    this.last,
    this.first,
    this.totalPages,
    this.size,
    this.numberOfElements,
    this.content,
  );

  factory PagedShoppingItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$PagedShoppingItemsResponseFromJson(json);

  final int number;
  final bool last;
  final bool first;
  final int totalPages;
  final int size;
  final int numberOfElements;
  final List<ShoppingItemResponse> content;
}
