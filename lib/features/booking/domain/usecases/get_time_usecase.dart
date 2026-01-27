import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/time_repository.dart';
import 'package:dartz/dartz.dart';

class GetTimeUsecase{
  final TimeRepository timeRepository;

  GetTimeUsecase({required this.timeRepository});
  Future<Either<Failure, TimeEntity?>> call()async{
  return  await timeRepository.getSavedTime();
  }
}