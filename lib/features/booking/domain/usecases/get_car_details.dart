import 'package:car_rental/core/error/failures.dart' show Failure;
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/booking_repository.dart';
import 'package:dartz/dartz.dart';

class GetCarDetailsUseCase{
  final BookingRepository bookingRepository;

  GetCarDetailsUseCase({required this.bookingRepository});

  Future<Either<Failure, CarDetailsEntity>> call(carId)async{
    print(carId);
    return await bookingRepository.getCarDetails(carId);
  }

}