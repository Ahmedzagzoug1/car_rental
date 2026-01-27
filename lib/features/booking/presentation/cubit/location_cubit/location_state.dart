
part of 'location_cubit.dart';


abstract class LocationState extends Equatable{
  @override
  List<Object?> get props =>[];
}

class LocationInitial extends LocationState {

}
class LocationLoading extends LocationState {}
class UserLocationLoaded extends LocationState {
  final PickupLocationEntity userLocation;

  UserLocationLoaded({required this.userLocation});
  @override
  List<Object?> get props =>[userLocation];
}
class LocationsLoaded extends LocationState {
  final List< PickupLocationEntity> pickupLocations;

  LocationsLoaded({required this.pickupLocations});

  @override
  List<Object?> get props =>[pickupLocations];
}
class SelectedLocation extends LocationState {
  final PickupLocationEntity selectedLocation;

  SelectedLocation({required this.selectedLocation});
  @override
  List<Object?> get props =>[selectedLocation];
}
class LocationError extends LocationState {
  final String errMessage;
  LocationError(this.errMessage);
  @override
  List<Object?> get props =>[errMessage];
}


