import 'package:codeblurb_mobile/data/content/models/payment_content_bundle_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_response.g.dart';

@JsonSerializable(createToJson: false)
class PaymentResponse {
  PaymentResponse(this.price, this.boughtContentBundles);

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);
  @JsonKey(name: 'pricePayed')
  final double price;
  final List<PaymentContentBundleResponse> boughtContentBundles;
}
