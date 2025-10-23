import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/data/repositories/create_booking_repository_implemention.dart';
import 'package:car_rental/features/booking/domain/repositories/booking_repository.dart';
import 'package:car_rental/features/booking/domain/repositories/time_repository.dart';
import 'package:dartz/dartz.dart';

class ClearTimeUsecase{
  TimeRepository timeRepository;
  ClearTimeUsecase({required this.timeRepository});
  Future<Either<Failure, Unit>> call(){
    return timeRepository.clearTime();
  }
}