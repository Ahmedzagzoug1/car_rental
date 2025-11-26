import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/core/network/check_network_connectivity.dart';
import 'package:car_rental/features/booking/data/data_source/local_data_source/location_local_data_source.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/location_remote_data_source.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource locationRemoteDataSource;
final LocationLocalDataSource  locationLocalDataSource;
  LocationRepositoryImpl({required this.locationLocalDataSource,required  this.locationRemoteDataSource});

  @override
  Future<Either<Failure, List<PickupLocationEntity>>> getLocations(carId)async {

    if(await NetworkConnectivity.checkInternetConnectivity()){
   try{
  List<PickupLocationModel> pickupLocationsModel= await locationRemoteDataSource.getLocations(carId);
  pickupLocationsModel.forEach((location){
    locationLocalDataSource.saveLocation(location);

  });
     return Right( pickupLocationsModel);
   }on ServerException{
     return Left(ServerFailure());

   }}else{
    try{
    locationLocalDataSource.getLocation();
    return Left(CacheFailure());
    }on EmptyCacheException{
      return Left(CacheFailure());

    }
    }
  }

  @override
  Future<Either<Failure, Unit>> saveLocation(PickupLocationEntity location) {
    // TODO: implement saveLocation
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PickupLocationEntity>> getUserLocation() async {
    try {
      final PickupLocationModel position = await locationRemoteDataSource
          .getCurrentLocation();

      return Right(position);
    } on ServerException catch (e) {
      return Left(ServerFailure());
    } on Exception {
      return const Left(
          ServerFailure());
    }
  }
}