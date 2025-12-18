import 'package:car_rental/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../repositories/approval_repository.dart';

class UploadProfilePhotoUsecase {
  final ApprovalRepository repo;

  UploadProfilePhotoUsecase(this.repo);

  Future<Either<Failure, String>> call(String filePath) {
    return repo.uploadProfilePhoto(filePath:filePath);
  }
}