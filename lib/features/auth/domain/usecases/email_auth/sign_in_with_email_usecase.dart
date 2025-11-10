import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/auth/domain/entities/user_entity.dart';
import 'package:car_rental/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignInWithEmailUsecase{
  final AuthRepository authRepository;

  SignInWithEmailUsecase({required this.authRepository});
  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
    String? phone,
  }) async{
    return await authRepository.signInWithEmail(email: email, password: password);
  }
}