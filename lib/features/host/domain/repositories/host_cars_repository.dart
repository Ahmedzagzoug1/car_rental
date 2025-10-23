import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/host/domain/entities/host_car_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HostCarsRepository{
  Future<Either<Failure,List<HostCarEntity>>> getHostCars(getHostCarParams) ;
  Future<Either<Failure,List<HostCarEntity>>> getHostOrderCars() ;

}