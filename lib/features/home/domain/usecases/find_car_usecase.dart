
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/domain/repositories/cars_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class FindCarUsecase{
  CarsRepository carsRepository;
  FindCarUsecase(this.carsRepository);
  Future<Either<Failure, CarEntity>> execute(GetCarParams getCarParams) async {
    // Here you can add any specific business rules before or after fetching
    // For example, caching logic, validation, or combining data from multiple sources
    return await carsRepository.findCar(getCarParams);
  }
}
// Parameters for the GetUser use case
class GetCarParams extends Equatable {
  final String carName;

  const GetCarParams({required this.carName});

  @override
  List<Object?> get props => [carName];
}