part of 'booking_cubit.dart';

sealed class BookingState extends Equatable {
  const BookingState();

}

final class BookingInitial extends BookingState {

  const BookingInitial();

  @override
  List<Object> get props => [];
}
final class BookingLoading extends BookingState {


  @override
  List<Object> get props => [];
}
final class BookingFinished extends BookingState {
  final BookingEntity bookingEntity;

  const BookingFinished(this.bookingEntity);

  @override
  List<Object> get props => [bookingEntity];
}
final class BookingFailure extends BookingState {
  final String  errMessage;

  const BookingFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}