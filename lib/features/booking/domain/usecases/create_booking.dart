import 'package:car_rental/core/error/failures.dart';

import 'package:car_rental/features/booking/domain/entities/booking_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/booking_repository.dart';
import 'package:dartz/dartz.dart';

class createBookingUseCase {
 final BookingRepository createBookingRepository;

  createBookingUseCase({required this.createBookingRepository});



  Future<Either<Failure, String>> call(BookingEntity booking) {
    return  createBookingRepository.createBooking(booking);
  }
}