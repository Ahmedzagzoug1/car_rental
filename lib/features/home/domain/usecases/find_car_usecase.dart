
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/domain/repositories/cars_repository.dart';
import 'package:dartz/dartz.dart';

class FindCarUsecase{
  CarsRepository carsRepository;
  FindCarUsecase(this.carsRepository);
  Future<Either<Failure, CarHomeEntity>> call(String car) async {

    return await carsRepository.findCar(car);
  }
}
