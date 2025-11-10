  import 'package:car_rental/core/error/failures.dart';
  import 'package:car_rental/features/auth/domain/repositories/auth_repository.dart';
  import 'package:dartz/dartz.dart';

  class UpgradeToHost{
  final AuthRepository authRepository;

  UpgradeToHost({required this.authRepository});
  Future<Either<Failure, Unit>> call() async{
  return await authRepository.upgradeToHost();
  }
  }
