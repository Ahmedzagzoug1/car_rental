import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/time_repository.dart';
import 'package:dartz/dartz.dart';

class SaveTimeUsecase{
  final TimeRepository timeRepository;

  SaveTimeUsecase({required this.timeRepository});
  Future<Either<Failure, Unit>> call(TimeEntity time){
    return  timeRepository.saveTime(time);
  }
}