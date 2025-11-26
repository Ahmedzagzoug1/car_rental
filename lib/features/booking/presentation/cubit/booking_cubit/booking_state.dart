part of 'booking_cubit.dart';

sealed class BookingState extends Equatable {
  const BookingState();
}

final class BookingInitial extends BookingState {
  @override
  List<Object> get props => [];
}
