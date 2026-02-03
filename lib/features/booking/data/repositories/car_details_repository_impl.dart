import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/data/data_source/local_data_source/car_details_local_data_source.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/car_details_remote_data_source.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/location_remote_data_source.dart';
import 'package:car_rental/features/booking/data/model/car_details_model.dart';
import 'package:car_rental/features/booking/data/model/host_model.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/domain/entities/host_entity.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/car_details_repository.dart';
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class CarDetailsRepositoryImpl implements CarDetailsRepository{
  final CarDetailsRemoteDataSource carDetailsRemoteDataSource;
  final CarDetailsLocalDataSource carDetailsLocalDataSource;

  CarDetailsRepositoryImpl({required this.carDetailsRemoteDataSource,
    required this.carDetailsLocalDataSource});


  @override
  Future<Either<Failure, CarDetailsEntity>>  getCarDetails(String carId) async {
  try {
  // 1. Try to fetch the base car model from Local Cache
  final carModel =await _getCarBaseModel(carId);

  // 2. Fetch Host and Locations (each has its own internal cache logic)
  // Running them in parallel using Future.wait
  final results = await Future.wait([
  _getHost(carId),
  _getLocations(carId),
  ]);

  final hostEntity = results[0] as HostEntity;
  final locationsList = results[1] as List<PickupLocationEntity>;

  // 3. Map to Domain Entity
  return Right(carModel!.toDomain(hostEntity, locationsList));
  } catch (e) {
return const Left(ServerFailure());
  }
  }

  /// Helper method to handle Car Base Model Cache/Remote logic
  Future<CarDetailsModel?> _getCarBaseModel(String carId) async {
  try {

  return  await carDetailsLocalDataSource.getCachedCarDetails(carId);
  } on NotFoundException {
    final remoteCar = await carDetailsRemoteDataSource.getCarDetails(carId);
    await carDetailsLocalDataSource.cacheCarDetails(carId, remoteCar);
    return remoteCar;
  }
  }


  /// Helper method for Host with Cache-aside pattern
  Future<HostEntity> _getHost(String carId) async {
  try {
  // Assuming getCachedHost returns HostModel
  final cachedHost =await carDetailsLocalDataSource.getCachedHost(carId);
  if (cachedHost != null) return cachedHost as HostEntity;
  throw NotFoundException();
  } catch (_) {
  final HostModel remoteHost = await carDetailsRemoteDataSource.getHost(carId);
  await carDetailsLocalDataSource.cacheHost(carId, remoteHost );
  return remoteHost as HostEntity;
  }
  }

  /// Helper method for Locations with Cache-aside pattern
  Future<List<PickupLocationEntity>> _getLocations(String carId) async {
  try {
  final cachedLocs =await carDetailsLocalDataSource.getCachedLocations(carId);
  if (cachedLocs != null) return cachedLocs;
  throw NotFoundException();
  } catch (_) {
  final remoteLocs = await carDetailsRemoteDataSource.getLocations(carId);
  await carDetailsLocalDataSource.cacheLocations(carId, remoteLocs);
  return remoteLocs;
  }
  }
  }


/*  @override
  Future<Either<Failure, CarDetailsEntity>> getCarDetails(carId)async {
    try{
      print('$carId repo imp');
      final CarModel? carModel=await carDetailsLocalDataSource.getCachedCar(carId);
      final locations=await carDetailsRemoteDataSource.getLocations(carId);

      debugPrint("$carModel repo");

if(carModel !=null) {
  final CarDetailsEntity carDetailsEntity = CarDetailsEntity(id: carModel.id,
      name: carModel.name,
      price: carModel.price,
      rate: carModel.rate,
      trips: carModel.trips,
      imagesUrl: carModel.imagesUrl,
      pickupLocationEntities: locations);
  debugPrint(" name ${carDetailsEntity.name}");

  return Right(carDetailsEntity);
}else{
  return const Left(OfflineFailure());
}
    }catch(e){
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, HostEntity>> getHost(carId)async {
    try {
      final hostModel = await carDetailsRemoteDataSource.getHost(carId);
      final hostEntity=HostEntity(name: hostModel.name, starHost: hostModel.starHost,
          joinTime: hostModel.joinTime, trips: hostModel.trips, imageUrl: hostModel.imageUrl,
          rate: hostModel.rate, responseTime: hostModel.responseTime, phoneNumber: hostModel.phoneNumber);
      return Right(hostEntity);
    }on NotFoundException {
      return const Left(NotFoundFailure());
    } catch(e){
      return const Left( ServerFailure());
    }
  }*/


