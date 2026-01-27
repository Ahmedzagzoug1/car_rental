import '../entities/payment_result.dart';

abstract class PaymentRepository {
  Future<PaymentResult> executePayment(String userId, String paymentMethod);
}