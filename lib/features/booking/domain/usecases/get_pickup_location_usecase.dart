import 'package:car_rental/features/booking/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/pickup_location_entity.dart';
import '../repositories/location_repository.dart';
class GetLocation{
  final LocationRepository locationRepository;

  GetLocation({required this.locationRepository});
  Future<Either<Failure, PickupLocationEntity?>> call()async{
    return await locationRepository.getLocation();
  }

}