import 'package:bloc/bloc.dart';
import 'package:car_rental/features/booking/domain/entities/booking_entity.dart';
import 'package:equatable/equatable.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(super.initialState);

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
}
