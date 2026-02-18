
import 'package:car_rental/features/approval/domain/entities/license_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/approval_repository.dart';

class UploadImageToOcrUsecase {
  final ApprovalRepository repository;

  UploadImageToOcrUsecase(this.repository);

  Future<Either<Failure, LicenseEntity>> call() {
    return repository.uploadImageToOcr();
  }
}