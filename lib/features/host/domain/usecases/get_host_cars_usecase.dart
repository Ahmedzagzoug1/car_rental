import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/core/shared_components/domain/usecase.dart';
import 'package:car_rental/features/host/domain/entities/host_car_entity.dart';
import 'package:car_rental/features/host/domain/repositories/host_cars_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCarsUsecase implements UseCase<List<HostCarEntity>, GetHostCarParams> {
  final HostCarsRepository repository; // Dependency on the repository interface

  GetCarsUsecase(this.repository);

  @override
  Future<Either<Failure,List< HostCarEntity>> > call(GetHostCarParams getHostCarParams) async {
    print('car use case-----------');
    return await repository.getHostCars(GetHostCarParams); // Delegates to the repository
  }

}
class GetHostCarParams extends  Params{
  final String hostId;
   GetHostCarParams({required this.hostId});

  @override
  List<Object?> get props => [hostId];
}