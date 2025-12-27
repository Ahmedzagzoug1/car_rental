import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/host/domain/entities/host_car_entity.dart';
import 'package:car_rental/features/host/domain/repositories/host_cars_repository.dart';
import 'package:dartz/dartz.dart';

class GetCarsUsecase {
  final HostCarsRepository repository; // Dependency on the repository interface

  GetCarsUsecase(this.repository);

  @override
  Future<Either<Failure,List< HostCarEntity>> > call(HostId) async {
    print('car use case-----------');
    return await repository.getHostCars(HostId); // Delegates to the repository
  }

}
