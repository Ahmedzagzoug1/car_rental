import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/approval_repository.dart';

class SendOtpUsecase {
  final ApprovalRepository repo;

  SendOtpUsecase(this.repo);

  Future<Either<Failure, Unit>> call(String phone) {
    return repo.sendOtp( phoneNumber: phone);
  }
}