import 'package:codeblurb_mobile/core/network/models/shopping_item_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shopping_cart_response.g.dart';

@JsonSerializable(createToJson: false)
class ShoppingCartResponse {
  ShoppingCartResponse(
    this.shoppingItems,
  );

  factory ShoppingCartResponse.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartResponseFromJson(json);

  final List<ShoppingItemResponse> shoppingItems;
}
