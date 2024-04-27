import 'package:codeblurb_mobile/network/models/previous_payments_response.dart';
import 'package:codeblurb_mobile/network/payment/payment_api.dart';

class PaymentRepository {
  PaymentRepository(this._paymentApi);
  final PaymentApi _paymentApi;

  Future<PreviousPaymentsResponse> getPayments() async {
    final response = await _paymentApi.getPayments();
    return PreviousPaymentsResponse.fromJson(response.data!);
  }
}
