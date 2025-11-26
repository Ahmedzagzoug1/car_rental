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
final class HostLoaded extends CarDetailsState {
  final HostEntity hostEntity;

  const HostLoaded({required this.hostEntity});

  @override
  List<Object> get props => [hostEntity];
}
final class CarDetailsFailure extends CarDetailsState {
  final String errMessage;

const  CarDetailsFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}