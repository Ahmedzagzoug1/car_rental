import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CarsRepository{
  Future<Either<Failure,List<CarEntity>>> getCars() ;
Future<Either<Failure, CarEntity>> findCar(carName);
}