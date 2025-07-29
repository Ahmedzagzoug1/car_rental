
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/domain/repositories/cars_repository.dart';
import 'package:equatable/equatable.dart';

class FindCarUsecase{
  CarsRepository carsRepository;
  FindCarUsecase(this.carsRepository);
  /*Future<CarEntity> execute() async {
    // Here you can add any specific business rules before or after fetching
    // For example, caching logic, validation, or combining data from multiple sources
    return await carsRepository.findCar();
  }*/
}
// Parameters for the GetUser use case
class GetUserParams extends Equatable {
  final String userId;

  const GetUserParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}