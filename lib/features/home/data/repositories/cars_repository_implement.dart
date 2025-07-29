import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/home/data/data_source/cars_data_source/car_remote_data_source.dart';
import 'package:car_rental/features/home/data/models/brand_model.dart';
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/domain/repositories/cars_repository.dart';
import 'package:dartz/dartz.dart';

class CarsRepositoryImplement implements CarsRepository{
  CarRemoteDataSource carRemoteDataSource;

  CarsRepositoryImplement(this.carRemoteDataSource);
  @override
  Future<Either<Failure,CarEntity>> findCar() {
    // TODO: implement findCar
    throw UnimplementedError();

  }


  @override
  Future<Either<Failure,List<CarEntity>>> getCars() async{
    try {
      List<CarModel>cars = await carRemoteDataSource.getCars();
      List<CarEntity> car_entities = cars.map((carModel) =>
          carModel.toCarHomeEntity()).toList();

      return Right(car_entities);
    }catch (e) {
      return Left(ServerFailure(message: 'Failed to get Cars.'));
    }
  }

}
/*
* // lib/features/user/data/repositories/user_repository_impl.dart

import 'package:dartz/dartz.dart'; // For Either

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data_source.dart';
import '../models/user_model.dart'; // For converting to UserModel

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  // final UserLocalDataSource localDataSource; // If you have local caching

  UserRepositoryImpl({
    required this.remoteDataSource,
    // required this.localDataSource,
  });

  @override
  Future<Either<Failure, User>> getUser(String userId) async {
    try {
      final remoteUser = await remoteDataSource.getUser(userId);
      // You could also cache here: await localDataSource.cacheUser(remoteUser);
      return Right(remoteUser.toEntity()); // Convert UserModel to User entity
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NotFoundException catch (e) {
      return Left(UserNotFoundFailure(e.message ?? 'User not found'));
    } on Exception { // Catch any other unexpected exceptions
      return Left(ServerFailure(message: 'An unexpected error occurred.'));
    }
  }

  @override
  Future<Either<Failure, User>> createUser(String name, String email) async {
    try {
      final newUserModel = await remoteDataSource.createUser(name, email);
      return Right(newUserModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on Exception {
      return Left(ServerFailure(message: 'Failed to create user.'));
    }
  }
}
*
* */




    // new code
/*class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;
  // final UserLocalDataSource _localDataSource; // Optional: for caching

  UserRepositoryImpl(this._remoteDataSource /*, this._localDataSource*/);

  @override
  Future<User?> getUserById(String id) async {
    try {
      // First, try to get from local cache (if implemented)
      // final localUser = await _localDataSource.getUserById(id);
      // if (localUser != null) return localUser.toEntity();

      // If not in cache or no local source, fetch from remote
      final remoteUser = await _remoteDataSource.getUserById(id);
      if (remoteUser != null) {
        // Optional: Save to local cache after fetching from remote
        // await _localDataSource.saveUser(remoteUser);
        return remoteUser.toEntity();
      }
      return null;
    } catch (e) {
      // Handle or rethrow specific exceptions
      print('UserRepositoryImpl error in getUserById: $e');
      return null; // Or throw a custom domain-specific exception
    }
  }

  @override
  Future<List<User>> getAllUsers() async {
    try {
      final remoteUsers = await _remoteDataSource.getAllUsers();
      // Optional: Update local cache
      // for (var userModel in remoteUsers) {
      //   await _localDataSource.saveUser(userModel);
      // }
      return remoteUsers.map((model) => model.toEntity()).toList();
    } catch (e) {
      print('UserRepositoryImpl error in getAllUsers: $e');
      return []; // Or throw a custom domain-specific exception
    }
  }

  @override
  Future<void> saveUser(User user) async {
    try {
      final userModel = UserModel.fromEntity(user);
      await _remoteDataSource.saveUser(userModel);
      // Optional: Update local cache
      // await _localDataSource.saveUser(userModel);
    } catch (e) {
      print('UserRepositoryImpl error in saveUser: $e');
      rethrow; // Re-throw to be handled by use case
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    try {
      await _remoteDataSource.deleteUser(id);
      // Optional: Delete from local cache
      // await _localDataSource.deleteUser(id);
    } catch (e) {
      print('UserRepositoryImpl error in deleteUser: $e');
      rethrow;
    }
  }
}*/