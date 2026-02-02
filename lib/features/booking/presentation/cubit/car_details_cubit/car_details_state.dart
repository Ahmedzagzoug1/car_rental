part of 'car_details_cubit.dart';

sealed class CarDetailsState extends Equatable {
  const CarDetailsState();
}

final class CarDetailsInitial extends CarDetailsState {
  @override
  List<Object> get props => [];
}
final class CarDetailsLoading extends CarDetailsState {
  @override
  List<Object> get props => [];
}
final class CarDetailsLoaded extends CarDetailsState {
  final CarDetailsEntity carDetailsEntity;

  const CarDetailsLoaded({required this.carDetailsEntity});

  @override
  List<Object> get props => [carDetailsEntity];
}
final class CarDetailsError extends CarDetailsState {
  final String error;
  const CarDetailsError(this.error);

  @override
  List<Object> get props => [error];
}
