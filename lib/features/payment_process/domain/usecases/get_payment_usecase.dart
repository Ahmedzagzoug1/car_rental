import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/payment_process/domain/entities/payment_response_entity.dart';
import 'package:car_rental/features/payment_process/domain/entities/payment_type.dart';
import 'package:dartz/dartz.dart';

import 'package:car_rental/features/payment_process/domain/repositories/payment_repository.dart';

class GetPaymentUsecase {
  final PaymentRepository paymentRepository;

  GetPaymentUsecase(this.paymentRepository);

 Future<Either<Failure, PaymentResponseEntity>> call(PaymentType paymentType) async {
    return await paymentRepository.getPaymentUrl(paymentType);
  }
}
