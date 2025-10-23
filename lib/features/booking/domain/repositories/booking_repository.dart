import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/data/model/booking_model.dart' show BookingModel;
import 'package:car_rental/features/booking/domain/entities/booking_entity.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepository {
  Future<Either<Failure, String>> createBooking(BookingEntity booking);
  Future<Either<Failure, CarDetailsEntity>> getCarDetails(carId);


}