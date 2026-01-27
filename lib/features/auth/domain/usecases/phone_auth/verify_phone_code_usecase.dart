import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyPhoneCodeUsecase{
  final AuthRepository authRepository;

  VerifyPhoneCodeUsecase({required this.authRepository});
  Future<Either<Failure, Unit>> call({
    required String verificationId,
    required String smsCode}) async{
    return await authRepository.verifyPhoneCode(verificationId: verificationId,smsCode:smsCode );
  }
}