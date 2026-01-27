import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/pickup_location_entity.dart';
import '../repositories/location_repository.dart';

class SavePickupLocationUsecase
{
  final LocationRepository locationRepository;

  SavePickupLocationUsecase({required this.locationRepository});
  Future<Either<Failure, Unit>> call(PickupLocationEntity location) async {
    return await locationRepository.saveLocation(location);
  }

}