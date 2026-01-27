import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    String? phone,
  });

  Future<Either<Failure, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  }) ;

  /// Phone Authentication (Step 1: send code)
  Future<Either<Failure, String>> signInWithPhone({
    required String phoneNumber,
  });

  /// Phone Authentication (Step 2: verify otp code)
  Future<Either<Failure, Unit>> verifyPhoneCode({
    required String verificationId,
    required String smsCode,
  });

  /// Get current user
  Future<Either<Failure, UserEntity?>> getCurrentUser();

  /// Save user to Firestore
  Future<Either<Failure, Unit>> saveUserData({required UserEntity user});

  /// Upgrade to Host
  Future<Either<Failure, Unit>> upgradeToHost();

  /// Is signed in
  Future<Either<Failure, bool>> isSignedIn();

  /// Logout
  Future<Either<Failure, Unit>> signOut();
}
