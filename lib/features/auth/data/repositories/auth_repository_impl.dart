import 'package:car_rental/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/remote_data_source/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
try {
  UserModel userModel = await remoteDataSource.signUpWithEmail(
    name: name,
    email: email,
    password: password,
    phone: phone,
  );
  final userEntity =userModel.toEntity();

  return Right(userEntity);
}on FirebaseAuthException catch (e) {
  switch (e.code) {
    case 'email-already-in-use':
      return const Left(EmailAlreadyInUseFailure());
    case 'invalid-email':
      return const Left(InvalidEmailFailure());
    case 'weak-password':
      return const Left(WeakPasswordFailure());
    default:
      return const Left(ServerFailure());
  }
} catch (e) {
  return const Left(ServerFailure());
}
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  }) async {
   try{
    UserModel userModel = await remoteDataSource.signInWithEmail(
      email: email,
      password: password,
    );
    final userEntity =userModel.toEntity();

    return Right(userEntity);
  }on FirebaseAuthException catch (e) {
  switch (e.code) {
  case 'email-already-in-use':
  return const Left(EmailAlreadyInUseFailure());
  case 'invalid-email':
  return const Left(InvalidEmailFailure());
  case 'weak-password':
  return const Left(WeakPasswordFailure());
  default:
  return const Left(ServerFailure());
  }
  } catch (e) {
  return const Left(ServerFailure());
  }
}

  @override
  Future<Either<Failure, String>> signInWithPhone({required String phoneNumber}) async {
    throw Exception();
  }

  @override
  Future<Either<Failure, Unit>> verifyPhoneCode({
    required String verificationId,
    required String smsCode,
  }) async {
  throw Exception();
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {

    try {
  final userModel=    await remoteDataSource.getCurrentUser();
  final userEntity=userModel?.toEntity();
      return Right(userEntity);
    }catch(e){
      return const Left(ServerFailure());
    }


  }
/*
  @override
  Future<Either<Failure, Unit>> saveUserData(UserEntity user) async {
    return await remoteDataSource.saveUserData(UserModel.fromEntity(user));
  }*/

  @override
  Future<Either<Failure, Unit>> upgradeToHost() async {


    try {
      await remoteDataSource.upgradeToHost();
      return const Right(unit);
    }catch(e){
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isSignedIn() async {
    final token = await remoteDataSource.getToken();
    return Right(token != null);
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(unit);
    }catch(e){
      return const Left(ServerFailure());
    }
  }

  Future<String?> getToken() async {
    return await remoteDataSource.getToken();
  }

  @override
  Future<Either<Failure, Unit>> saveUserData({required UserEntity user})async {
    try {
      final userModel =UserModel(id: user.id, name: user.name, email: user.email, createdAt: user.createdAt);
      await remoteDataSource.saveUserData(userModel);
      return const Right(unit);
    }catch(e){
      return const Left(ServerFailure());
    }
  }

}
