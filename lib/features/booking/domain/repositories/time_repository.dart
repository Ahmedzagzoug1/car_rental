import 'package:car_rental/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../entities/time_entity.dart';

abstract class TimeRepository {
  Future<Either<Failure, Unit>> saveTime(TimeEntity time);
  Future<Either<Failure, TimeEntity?>> getSavedTime();
  Future<Either<Failure, Unit>> clearTime();
}
