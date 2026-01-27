import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/create_booking_remote_data_source.dart';
import 'package:car_rental/features/booking/domain/entities/booking_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/booking_repository.dart';
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/data/model/booking_model.dart' show BookingModel;
import 'package:dartz/dartz.dart';

 class BookingRepositoryImplementation implements BookingRepository {

   final CreateBookingRemoteDataSource createBookingRemoteDataSource;
   BookingRepositoryImplementation( { required
   this.createBookingRemoteDataSource
   });

   @override
   Future<Either<Failure, String>> createBooking(BookingEntity booking) async {
     try {
       final result = await createBookingRemoteDataSource.createBooking(booking as BookingModel);
       return Right(result);
     } on ServerException {
       return const Left(ServerFailure());
     }
   }



   }


