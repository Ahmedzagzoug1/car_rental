import 'package:dartz/dartz.dart';

import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/location_repository.dart';

class SavePickupLocationUsecase
{
  final LocationRepository locationRepository;

  SavePickupLocationUsecase({required this.locationRepository});
  Future<Either<Failure, Unit>> call(PickupLocationEntity location) async {
    return await locationRepository.saveLocation(location);
  }

}