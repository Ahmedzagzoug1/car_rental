import 'package:car_rental/features/approval/domain/repositories/approval_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:car_rental/core/error/failures.dart';

class ScanFromGalleryUseCase {
  final ApprovalRepository approvalRepository;
  ScanFromGalleryUseCase(this.approvalRepository);

  Future<Either<Failure,String?>> call() async {
    return await approvalRepository.getFromGallery();
  }
}