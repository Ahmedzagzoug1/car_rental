import 'package:bloc/bloc.dart';
import 'package:car_rental/features/booking/domain/entities/booking_entity.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/time_cubit/time_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/trip_date_cubit/trip_date_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());


  BookingEntity? _bookingEntity;

  /* addBooking(bookingEntity) {
    _bookingEntity=bookingEntity;
   if ( _bookingEntity?.pickupLocation != null && _bookingEntity?.timeEntity != null
   && _bookingEntity?.carDetailsEntity != null){

     emit(BookingFinished(bookingEntity));

   }
    else {
     emit(BookingFailure(_getMissingFieldsMessage(bookingEntity)));
   }
  }*/
  void processBooking(
      {required dynamic timeState, required dynamic carState, required dynamic locState}) {
    emit(BookingLoading());
    try {
      if (timeState is TripDateChanged && carState is CarDetailsLoaded &&
          locState is SelectedLocation) {
        final entity = BookingEntity(
          timeEntity: timeState.timeEntity,
          pickupLocation: locState.selectedLocation,
          carDetailsEntity: carState.carDetailsEntity,
        );

        emit(BookingFinished(entity));
      } else {
        List<String> missing = [];

        if (timeState is! TripDateChanged) missing.add("Time");
        if (locState is! SelectedLocation) missing.add("Location");
        if (carState is! CarDetailsLoaded) missing.add("Car Details");
debugPrint('${timeState.toString()}');
        emit(BookingFailure("Please complete: ${missing.join(', ')}"));
      }
    } catch (e) {
      emit(BookingFailure("Unexpected error: ${e.toString()}"));
    }
  }
}
/*
  bool _hasLocation(bookingEntity) => bookingEntity.pickupLocation != null;
  bool _hasTime(bookingEntity) => bookingEntity.timeEntity != null;

   _getMissingFieldsMessage(bookingEntity) {

    if (!_hasLocation(bookingEntity) && !_hasTime(bookingEntity)) {
      return 'You must select location and time';
    } else if (!_hasLocation(bookingEntity)) {
      return 'You must select location';
    } else if (!_hasTime(bookingEntity)) {
      return 'You must select time';
    }
    return null;
  }
}*/


/*  final SubmitBookingUseCase submitBookingUseCase;

  BookingCubit(this.submitBookingUseCase)
      : super(BookingInitial(BookingEntity()));

  BookingEntity get booking => (state as dynamic).booking;

  // Step 1: اختيار العربية
  void setCar(String carId) {
    final updated = booking.copyWith(carId: carId);
    emit(BookingUpdated(updated));
  }

  // Step 2: اختيار الوقت
  void setDates(DateTime start, DateTime end) {
    final updated = booking.copyWith(startDate: start, endDate: end);
    emit(BookingUpdated(updated));
  }

  // Step 3: اختيار موقع الاستلام
  void setPickup(String location) {
    final updated = booking.copyWith(pickupLocation: location);
    emit(BookingUpdated(updated));
  }

  // Step 4: اختيار موقع التسليم
  void setDropoff(String location) {
    final updated = booking.copyWith(dropoffLocation: location);
    emit(BookingUpdated(updated));
  }

  Future<void> submitBooking() async {
    emit(BookingSubmitting());

    final result = await submitBookingUseCase(booking);

    result.fold(
          (failure) => emit(BookingFailure(failure.message)),
          (_) => emit(BookingSuccess()),
    );
  }*/

