import 'package:car_rental/features/booking/domain/entities/host_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/car_details_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class GetHostUsecase{
  final CarDetailsRepository carDetailsRepository;

  GetHostUsecase({required this.carDetailsRepository});
  Future<Either<Failure, HostEntity>> getHost(carId){
    print('host uses case ${carId}');
    return carDetailsRepository.getHost(carId);
  }
}