import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/data/data_source/local_data_source/car_details_local_data_source.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/car_details_remote_data_source.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/location_remote_data_source.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/domain/entities/host_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/car_details_repository.dart';
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class CarDetailsRepositoryImpl implements CarDetailsRepository{
  final CarDetailsRemoteDataSource carDetailsRemoteDataSource;
  final CarDetailsLocalDataSource carDetailsLocalDataSource;
  final LocationRemoteDataSource locationRemoteDataSource;
  CarDetailsRepositoryImpl({required this.carDetailsRemoteDataSource, required this.carDetailsLocalDataSource,
  required this.locationRemoteDataSource});

  @override
  Future<Either<Failure, CarDetailsEntity>> getCarDetails(carId)async {
    try{
      print('${carId} repo imp');
      final CarModel? carModel=await carDetailsLocalDataSource.getCachedCar(carId);
      final locations=await carDetailsRemoteDataSource.getLocations(carId);

      debugPrint("${carModel} repo");

if(carModel !=null) {
  final CarDetailsEntity carDetailsEntity = CarDetailsEntity(id: carModel.id,
      name: carModel.name,
      price: carModel.price,
      rate: carModel.rate,
      trips: carModel.trips,
      imagesUrl: carModel.imagesUrl,
      pickupLocationEntities: locations??[]);
  debugPrint(" name ${carDetailsEntity.name}");

  return Right(carDetailsEntity);
}else{
  return Left(OfflineFailure());
}
    }catch(e){
      return Left(ServerFailure());
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
    }on NotFoundException catch(e){
      return const Left(NotFoundFailure());
    } catch(e){
      return const Left( ServerFailure());
    }
  }
  }
