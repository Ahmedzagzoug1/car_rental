import 'package:car_rental/features/payment_process/domain/repositories/payment_repository.dart';

import '../../domain/entities/payment_result.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  @override
  Future<PaymentResult> executePayment(String userId, String paymentMethod) async {
    try {
      if(paymentMethod == "credit_card") {
        // call your Payment Gateway SDK
    /*    bool success = await CreditCardGateway.charge(userId);
        return PaymentResult(
            success: success,
            message: success ? "Payment successful" : "Payment failed"
        );*/
      }

      if(paymentMethod == "fawry") {
/*        bool success = await FawryGateway.pay(userId);
        return PaymentResult(
            success: success,
            message: success ? "Payment successful" : "Payment failed"
        );*/
      }

      return PaymentResult(success: false, message: "Payment method not supported");

    } catch(e) {
      return PaymentResult(success: false, message: e.toString());
    }
  }
}
