import 'package:car_rental/features/booking/domain/entities/host_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';

abstract class CarDetailsRepository{
  Future<Either<Failure, CarDetailsEntity>> getCarDetails(String carId);
}