import 'package:codeblurb_mobile/data/payment/models/payment_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'previous_payments_response.g.dart';

@JsonSerializable(createToJson: false)
class PreviousPaymentsResponse {
  PreviousPaymentsResponse(this.previousPayments);

  factory PreviousPaymentsResponse.fromJson(Map<String, dynamic> json) =>
      _$PreviousPaymentsResponseFromJson(json);
  final List<PaymentResponse> previousPayments;
}
