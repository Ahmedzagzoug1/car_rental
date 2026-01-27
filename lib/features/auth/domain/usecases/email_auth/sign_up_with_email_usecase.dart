  import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/auth/domain/entities/user_entity.dart';
  import 'package:car_rental/features/auth/domain/repositories/auth_repository.dart';
  import 'package:dartz/dartz.dart';

  class SignUpWithEmailUseCase{
  final AuthRepository authRepository;

  SignUpWithEmailUseCase({required this.authRepository});
  Future<Either<Failure, UserEntity>> call({
    required String name,
  required String email,
  required String password,
  String? phone,
  }) async{
  return await authRepository.signUpWithEmail(name: name, email: email, password: password);
  }

}