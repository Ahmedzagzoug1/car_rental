import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/auth/domain/entities/user_entity.dart';
import 'package:car_rental/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SaveUserData{
  final AuthRepository authRepository;

  SaveUserData({required this.authRepository});
  Future<Either<Failure, Unit>> call({
    required UserEntity user
  }) async{
    return await authRepository.saveUserData(user: user);
  }
}