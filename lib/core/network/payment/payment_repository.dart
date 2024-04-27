import 'package:codeblurb_mobile/core/network/models/previous_payments_response.dart';
import 'package:codeblurb_mobile/core/network/payment/payment_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentRepoProvider = Provider<PaymentRepository>(
  (ref) => PaymentRepository(ref.watch(paymentApiProvider)),
  name: 'Payment Repository Provider',
);

class PaymentRepository {
  PaymentRepository(this._paymentApi);
  final PaymentApi _paymentApi;

  Future<PreviousPaymentsResponse> getPayments() async {
    final response = await _paymentApi.getPayments();
    return PreviousPaymentsResponse.fromJson(response.data!);
  }
}
