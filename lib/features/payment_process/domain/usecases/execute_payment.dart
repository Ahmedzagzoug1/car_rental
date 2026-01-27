import '../entities/payment_result.dart';
import '../repositories/payment_repository.dart';

class ExecutePayment {
  final PaymentRepository paymentRepository;

  ExecutePayment(this.paymentRepository);

  Future<PaymentResult> call(String userId, String paymentMethod) async {
    // هنا ممكن نضيف شروط اضافية قبل الدفع لو حبيت
    return await paymentRepository.executePayment(userId, paymentMethod);
  }
}
