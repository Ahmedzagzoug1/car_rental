import 'package:car_rental/features/booking/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/pickup_location_entity.dart';
import '../repositories/location_repository.dart';
class GetPickupLocationsUsecase{
  final LocationRepository locationRepository;

  GetPickupLocationsUsecase({required this.locationRepository});
  Future<Either<Failure, List<PickupLocationEntity?>>> call(carId)async{
    return await locationRepository.getLocations(carId);
  }

}