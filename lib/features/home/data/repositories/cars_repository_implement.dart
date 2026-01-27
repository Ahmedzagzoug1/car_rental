import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/home/data/data_source/cars_data_source/cars_local_data_source.dart';
import 'package:car_rental/features/home/data/data_source/cars_data_source/cars_remote_data_source.dart';
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';

import 'package:car_rental/features/home/domain/repositories/cars_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';


class CarsRepositoryImplement implements CarsRepository{
 final  CarsRemoteDataSource carsRemoteDataSource;
 final  CarsLocalDataSource carsLocalDataSource;

const  CarsRepositoryImplement({required this.carsRemoteDataSource,
required this.carsLocalDataSource});
  @override
  Future<Either<Failure,CarHomeEntity>> findCar(getCarParams) {
    // TODO: implement findCar
    throw UnimplementedError();

  }


  @override
  Future<Either<Failure, List<CarHomeEntity>>> getCars() async {
    try {
      final List<CarModel> offlineCars =await carsLocalDataSource.getCachedCars();
      if(offlineCars.isNotEmpty ) {
        return Right(offlineCars.map((carModel)=>carModel.toEntity() ).toList());
      }else {
       // if (await NetworkConnectivity.checkInternetConnectivity()) {
          final List<CarModel> cars = await carsRemoteDataSource.getCars();
          final carEntities = cars
              .map((carModel) => carModel.toEntity())
              .toList();
          debugPrint('${cars.length} car entity');
          carsLocalDataSource.cacheCars(cars);
          return Right(carEntities);
       /* } else {
          return const Left(ServerFailure());
        }*/
      }
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
