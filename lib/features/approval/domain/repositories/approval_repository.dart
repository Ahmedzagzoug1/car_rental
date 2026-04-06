import 'package:car_rental/features/approval/domain/entities/license_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class ApprovalRepository{
  Future<Either<Failure, bool>> verifyOtp({
    required String otp,
  });
  Future<Either<Failure, Unit>> sendOtp({
    required String phoneNumber,
  });
  Future<Either<Failure, String>> uploadProfilePhoto();
  Future<Either<Failure,String>> getFromGallery();
  Future<Either<Failure,LicenseEntity>> uploadImageToOcr();
}