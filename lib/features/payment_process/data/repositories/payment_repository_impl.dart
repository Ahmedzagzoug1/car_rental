import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/payment_process/data/data_source/payment_remote_data_source.dart';
import 'package:car_rental/features/payment_process/data/model/payment_request_model.dart';
import 'package:car_rental/features/payment_process/domain/entities/payment_request_entity.dart';
import 'package:car_rental/features/payment_process/domain/entities/payment_response_entity.dart';
import 'package:car_rental/features/payment_process/domain/entities/payment_type.dart';
import 'package:car_rental/features/payment_process/domain/repositories/payment_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:car_rental/core/error/exceptions.dart';


class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;

  PaymentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, PaymentResponseEntity>> getPaymentUrl(PaymentType paymentType) async {
    try {

      final responseModel = await remoteDataSource.getPaymentKeys(paymentType);

      return Right(responseModel.toEntity());
      
    } on ServerException {
      return const Left(ServerFailure());
    } on InvalidInputException {
      return const Left(NotFoundFailure());
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}