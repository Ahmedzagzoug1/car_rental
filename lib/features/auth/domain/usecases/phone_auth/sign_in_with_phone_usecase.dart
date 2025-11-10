import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignInWithPhoneUsecase{
  final AuthRepository authRepository;

  SignInWithPhoneUsecase({required this.authRepository});
  Future<Either<Failure, String>> call({
   required String phone,
  }) async{
    return await authRepository.signInWithPhone(phoneNumber:phone);
  }
}