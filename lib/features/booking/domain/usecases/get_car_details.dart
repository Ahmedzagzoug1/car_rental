import 'package:car_rental/core/error/failures.dart' show Failure;
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/car_details_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class GetCarDetailsUseCase{
  final CarDetailsRepository carDetailsRepository;

  GetCarDetailsUseCase({required this.carDetailsRepository});

  Future<Either<Failure, CarDetailsEntity>> call(carId)async{
    debugPrint('$carId use case');
    return await carDetailsRepository.getCarDetails(carId);
  }

}