import 'package:car_rental/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import 'package:car_rental/features/approval/domain/repositories/approval_repository.dart';

class UploadProfilePhotoUsecase {
  final ApprovalRepository repo;

  UploadProfilePhotoUsecase(this.repo);

  Future<Either<Failure, String>> call() {
    return repo.uploadProfilePhoto();
  }
}