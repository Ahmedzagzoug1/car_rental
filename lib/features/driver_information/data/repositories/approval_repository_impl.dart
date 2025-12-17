import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/driver_information/data/data_source/approval_remote_datasource/approval_remote_datasource.dart';
import 'package:car_rental/features/driver_information/domain/repositories/approval_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApprovalRepositoryImpl implements ApprovalRepository{
  final ApprovalRemoteDatasource approvalRemoteDatasource;

  ApprovalRepositoryImpl({required this.approvalRemoteDatasource});
  late final String verificationId;
  @override
  Future<Either<Failure, Unit>> sendOtp({required String phoneNumber})async {
    try {
      verificationId =
      await approvalRemoteDatasource.SendOtp(phoneNumber: phoneNumber);
      return const Right(unit);
    }on FirebaseAuthException {
      return const Left(AuthFailure());
    }on ServerException{
    return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePhoto({required String filePath}) async{
    try {
   final String url=   await approvalRemoteDatasource.uploadImage(filePath);
      return Right(url);
    }on ServerException{
      return const Left(ServerFailure());
    }
  }


  @override
  Future<Either<Failure, bool>> verifyOtp({required String otp}) async {
    try {
      await approvalRemoteDatasource.verifyPhoneCode(
          verificationId: verificationId, smsCode: otp);
      return Right(true);
    }on FirebaseAuthException {
      return const Left(AuthFailure());
    }on ServerException{
      return const Left(ServerFailure());
    }
  }

}