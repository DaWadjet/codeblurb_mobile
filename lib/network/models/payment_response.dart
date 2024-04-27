import 'package:codeblurb_mobile/network/models/minimal_content_bundle_response.dart';
import 'package:codeblurb_mobile/network/models/payment_status_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_response.g.dart';

@JsonSerializable(createToJson: false)
class PaymentResponse {
  PaymentResponse(this.status, this.boughtContentBundles);

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);

  final PaymentStatusType status;
  final List<MinimalContentBundleResponse> boughtContentBundles;
}
