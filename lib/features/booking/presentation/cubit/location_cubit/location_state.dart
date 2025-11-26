
part of 'location_cubit.dart';


abstract class LocationState {}

class LocationInitial extends LocationState {}
class LocationLoading extends LocationState {}
class UserLocationLoaded extends LocationState {
  final PickupLocationEntity userLocation;

  UserLocationLoaded({required this.userLocation});

}
class LocationsLoaded extends LocationState {
  final List< PickupLocationEntity> pickupLocations;

  LocationsLoaded({required this.pickupLocations});


}
class LocationError extends LocationState {
  final String message;
  LocationError(this.message);
}


