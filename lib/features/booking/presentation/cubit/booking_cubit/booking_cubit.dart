import 'package:bloc/bloc.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:equatable/equatable.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());


  PickupLocationEntity? selectedLocation;
  TimeEntity? selectedTime;
  CarDetailsEntity? selectedCar;



  void setPickup(PickupLocationEntity location) {
    selectedLocation =location;
    emit(BookingUpdated());
  }

  void setTime(TimeEntity time) {
    selectedTime = time;
    emit(BookingUpdated());
  }

  void setCarDetails(CarDetailsEntity carDetails) {
    selectedCar = carDetails;
    emit(BookingUpdated());
  }
  bool isBookingComplete() {
    return selectedLocation != null &&
        selectedCar != null &&
        selectedTime != null;
  }
  bool hasLocation() => selectedLocation != null;
  bool hasTime() => selectedTime != null;
  bool hasCar() => selectedCar != null;

  String? getMissingFieldsMessage() {
    if (isBookingComplete()) return null;

    if (!hasLocation() && !hasTime()) {
      return 'You must select location and time';
    } else if (!hasLocation()) {
      return 'You must select location';
    } else if (!hasTime()) {
      return 'You must select time';
    }
    return null;
  }
}


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

