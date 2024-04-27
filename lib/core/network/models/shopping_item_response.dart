import 'package:codeblurb_mobile/core/network/models/minimal_content_bundle_response.dart';
import 'package:codeblurb_mobile/core/network/models/ratings_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shopping_item_response.g.dart';

@JsonSerializable(createToJson: false)
class ShoppingItemResponse {
  ShoppingItemResponse(
    this.id,
    this.title,
    this.price,
    this.contentBundle,
    this.numberOfPurchases,
    this.ratings,
  );

  factory ShoppingItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemResponseFromJson(json);
  final int id;
  final String title;
  final double price;
  final int numberOfPurchases;
  final RatingsResponse ratings;
  final MinimalContentBundleResponse contentBundle;
}
