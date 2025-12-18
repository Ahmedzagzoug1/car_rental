import 'package:car_rental/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../repositories/approval_repository.dart';

class VerifyOtpUsecase {
  final ApprovalRepository repo;

  VerifyOtpUsecase(this.repo);

  Future<Either<Failure, bool>> call(String otp) {
    return repo.verifyOtp(otp: otp);
  }
}