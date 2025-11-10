  import 'package:car_rental/core/error/failures.dart';
  import 'package:car_rental/features/auth/domain/repositories/auth_repository.dart';
  import 'package:dartz/dartz.dart';

  class SignOutUsecase{
  final AuthRepository authRepository;

  SignOutUsecase({required this.authRepository});
  Future<Either<Failure, Unit>> call() async{
  return await authRepository.signOut();
  }

}