import 'package:dartz/dartz.dart';

import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/approval/domain/repositories/approval_repository.dart';

class SendOtpUsecase {
  final ApprovalRepository repo;

  SendOtpUsecase(this.repo);

  Future<Either<Failure, Unit>> call(String phone) {
    return repo.sendOtp( phoneNumber: phone);
  }
}