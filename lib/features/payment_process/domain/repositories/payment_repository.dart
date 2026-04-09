import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/payment_process/domain/entities/payment_response_entity.dart';
import 'package:car_rental/features/payment_process/domain/entities/payment_type.dart';

import 'package:dartz/dartz.dart';
abstract class PaymentRepository {
Future<Either<Failure, PaymentResponseEntity>> getPaymentUrl(PaymentType paymentType);}