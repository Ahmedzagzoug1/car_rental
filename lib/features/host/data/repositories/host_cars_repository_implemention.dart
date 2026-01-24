import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/data/model/car_model.dart';
import 'package:car_rental/features/host/data/data_source/remote_host_cars_data_source/remote_host_cars_data_source.dart';
import 'package:car_rental/features/host/data/model/host_car_model.dart';
import 'package:car_rental/features/host/domain/entities/host_car_entity.dart';
import 'package:car_rental/features/host/domain/repositories/host_cars_repository.dart';
import 'package:dartz/dartz.dart';

class HostCarsRepositoryImplemention implements HostCarsRepository{
 final RemoteHostCarsDataSource remoteHostCarsDataSource;
HostCarsRepositoryImplemention(this.remoteHostCarsDataSource);

  @override
  Future<Either<Failure, List<HostCarEntity>>> getHostCars(getHostCarParams)async {
 try{
   final carsModel=await  remoteHostCarsDataSource.getHostCars(getHostCarParams);
     final carsEntity=carsModel.map((car)=>(car as HostCarModel).toDomain()).toList();
     return Right(carsEntity);
 } on ServerException catch(e) {
   return Left(ServerFailure(message: e.toString()));
 } on Exception { // Catch any other unexpected exceptions
   return Left(ServerFailure(message: 'An unexpected error occurred.'));
 }
  }

  @override
  Future<Either<Failure, List<HostCarEntity>>> getHostOrderCars() {
    // TODO: implement getHostOrderCars
    throw UnimplementedError();
  }



}