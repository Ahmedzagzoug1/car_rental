import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/location_data_source.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource locationDataSource;

  LocationRepositoryImpl({required this.locationDataSource});

  @override
  Future<Either<Failure, PickupLocationEntity?>> getLocation() {
    // TODO: implement getLocation
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> saveLocation(PickupLocationEntity location) {
    // TODO: implement saveLocation
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PickupLocationEntity?>> getUserLocation() async {
    try {
      final PickupLocationModel position = await locationDataSource
          .getCurrentLocation();

      return Right(position);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } on Exception {
      return const Left(
          ServerFailure(message: 'An unexpected error occurred.'));
    }
  }
}