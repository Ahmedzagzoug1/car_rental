import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/home/data/data_source/local_data_source/cars_local_data_source.dart';
import 'package:car_rental/features/home/data/data_source/remote_data_source/cars_remote_data_source.dart';
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';

import 'package:car_rental/features/home/domain/repositories/cars_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';


class CarsRepositoryImplement implements CarsRepository {
  final CarsRemoteDataSource carsRemoteDataSource;
  final CarsLocalDataSource carsLocalDataSource;


  const CarsRepositoryImplement({required this.carsRemoteDataSource,
    required this.carsLocalDataSource});

  @override
  Future<Either<Failure, CarHomeEntity>> findCar(getCarParams) {
    // TODO: implement findCar
    throw UnimplementedError();
  }


  @override
  Future<Either<Failure, List<CarHomeEntity>>> getCars() async {
    try {
     final List<CarModel> offlineCars = await carsLocalDataSource
          .getCachedCars();
      final int lastCacheTime = await carsLocalDataSource
          .getLastCacheTimestamp();

      bool isCacheExpired = _isTTLFinished(lastCacheTime);

      if (offlineCars.isNotEmpty && !isCacheExpired) {
        return Right(offlineCars.map((car) => car.toEntity()).toList());
      }

      try {
        final List<CarModel> remoteCars = await carsRemoteDataSource.getCars();
        await carsLocalDataSource.cacheCars(
            remoteCars);

        return Right(remoteCars.map((car) => car.toEntity()).toList());
      } catch (e) {
        if (offlineCars.isNotEmpty) {
          return Right(offlineCars.map((car) => car.toEntity()).toList());
        }
        return const Left(ServerFailure());
      }
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  bool _isTTLFinished(int savedTimestamp) {
    const int CACHE_DURATION_IN_HOURS = 2;

    final now = DateTime
        .now()
        .millisecondsSinceEpoch;
    final duration = CACHE_DURATION_IN_HOURS * 60 * 60 * 1000;
    return (now - savedTimestamp) > duration;
  }
}
