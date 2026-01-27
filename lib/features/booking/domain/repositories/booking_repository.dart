import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/domain/entities/booking_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepository {
  Future<Either<Failure, String>> createBooking(BookingEntity booking);


}