import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserLocationUseCase{
  LocationRepository locationRepository;
  GetUserLocationUseCase({required this.locationRepository});
  Future<Either<Failure, PickupLocationEntity>> call(){
    return locationRepository.getUserLocation();
  }
}