import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/time_repository.dart';
import 'package:dartz/dartz.dart';

import '../data_source/local_data_source/time_local_data_source.dart';
import '../model/time_model.dart';

class BookingTimeRepositoryImpl implements TimeRepository {
  final BookingTimeLocalDataSource localDataSource;

  BookingTimeRepositoryImpl(this.localDataSource);


  @override
  Future<Either<Failure, Unit>> clearTime() async {
    try {
      await localDataSource.clearBooking();
      return const Right(unit);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, TimeEntity?>> getSavedTime()async {
    try {
      final model = localDataSource.getBooking();
      if (model == null) return const Right(null);

      final entity = TimeEntity(
        pickupDate: model.pickupDate,
        pickupTime: model.pickupTime,
        returnDate: model.returnDate,
        returnTime: model.returnTime,
      );
      return Right(entity);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> saveTime(TimeEntity entity) async{
    try {
      final model = TimeModel(
        pickupDate: entity.pickupDate,
        pickupTime: entity.pickupTime,
        returnDate: entity.returnDate,
        returnTime: entity.returnTime,
      );
      await localDataSource.saveBooking(model);
      return const Right(unit);
    } catch (e) {
      return const Left(CacheFailure( ));
    }

  }
}
