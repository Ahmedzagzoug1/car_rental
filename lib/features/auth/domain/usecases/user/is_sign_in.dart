import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class IsSignIn{
  final AuthRepository authRepository;

IsSignIn({required this.authRepository});
Future<Either<Failure, bool>> call({
required String email,
required String password,
String? phone,
}) async{
return await authRepository.isSignedIn();
}
}