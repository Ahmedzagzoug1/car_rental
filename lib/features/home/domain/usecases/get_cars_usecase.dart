
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/domain/repositories/cars_repository.dart';
import 'package:dartz/dartz.dart'; // For Either

import '../../../../core/error/failures.dart';

class GetCarsUsecase {
  final CarsRepository carsRepository;

  GetCarsUsecase(this.carsRepository);

  @override
  Future<Either<Failure, List<CarHomeEntity>>> call() async {


    return await carsRepository.getCars();
  }
}

