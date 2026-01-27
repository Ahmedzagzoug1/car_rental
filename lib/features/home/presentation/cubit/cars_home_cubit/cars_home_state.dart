part of 'cars_home_cubit.dart';

sealed class CarsHomeState extends Equatable {
  const CarsHomeState();
}

final class CarsHomeInitial extends CarsHomeState {
  @override
  List<Object> get props => [];
}
final class CarsHomeLoading extends CarsHomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class CarsHomeLoaded extends CarsHomeState {
 final List<CarHomeEntity> cars;

  const CarsHomeLoaded({required this.cars});
  @override
  // TODO: implement props
  List<Object?> get props => [cars];
}
final class CarsHomeFailure extends CarsHomeState {
  final String errmessage;

  const CarsHomeFailure(this.errmessage);
  @override
  // TODO: implement props
  List<Object?> get props => [errmessage];
}
final class CarSelectedState extends CarsHomeState{
  final selectedCar;
  const CarSelectedState(this.selectedCar);
  @override
  // TODO: implement props
  List<Object?> get props => [selectedCar];

}