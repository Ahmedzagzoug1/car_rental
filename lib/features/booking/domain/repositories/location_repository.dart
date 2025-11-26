import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:dartz/dartz.dart';
import '../entities/time_entity.dart';

abstract class LocationRepository {
  Future<Either<Failure, Unit>> saveLocation(PickupLocationEntity location);
  Future<Either<Failure, List<PickupLocationEntity>>> getLocations(carId);
  Future<Either<Failure, PickupLocationEntity>> getUserLocation();

}
