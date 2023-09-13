import 'package:codeblurb_mobile/data/shopping/models/minimal_content_bundle_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shopping_item_response.g.dart';

@JsonSerializable(createToJson: false)
class ShoppingItemResponse {
  ShoppingItemResponse(
    this.id,
    this.title,
    this.price,
    this.contentBundle,
    this.imageUrl,
    this.instructorNames,
  );

  factory ShoppingItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemResponseFromJson(json);
  final int id;
  final String title;
  final double price;
  //new
  final String imageUrl;
  final List<String> instructorNames;

  final MinimalContentBundleResponse contentBundle;
}
