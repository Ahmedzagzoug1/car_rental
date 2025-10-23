import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/home/data/data_source/cars_data_source/car_remote_data_source.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';

import 'package:car_rental/features/home/domain/repositories/cars_repository.dart';
import 'package:dartz/dartz.dart';

class CarsRepositoryImplement implements CarsRepository{
 final  CarRemoteDataSource carRemoteDataSource;

const  CarsRepositoryImplement({required this.carRemoteDataSource});
  @override
  Future<Either<Failure,CarHomeEntity>> findCar(getCarParams) {
    // TODO: implement findCar
    throw UnimplementedError();

  }


  @override
  Future<Either<Failure, List<CarHomeEntity>>> getCars() async {
    try {
      final cars = await carRemoteDataSource.getCars();
      final carEntities = cars.map((carModel) =>( carModel )as CarHomeEntity).toList();

      return Right(carEntities);
    } on ServerException catch(e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
