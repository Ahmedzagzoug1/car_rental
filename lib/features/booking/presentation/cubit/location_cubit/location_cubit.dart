import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/domain/usecases/get_pickup_locations_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/get_user_location.dart';
import 'package:car_rental/features/booking/domain/usecases/save_pickup_location_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetUserLocationUseCase getUserLocationUseCase;
final GetPickupLocationsUsecase getPickupLocationsUsecase;
final SavePickupLocationUsecase savePickupLocationUsecase;

late final List<PickupLocationEntity> pickuplocations;
  LocationCubit({required this.getUserLocationUseCase,
  required this.savePickupLocationUsecase,required this.getPickupLocationsUsecase
  }) : super(LocationInitial());
initLocations(pickupLocations){
  getCurrentLocation();
  getLocations(pickupLocations);
}

 getCurrentLocation() async {
    emit(LocationLoading());
    try {
      final location = await getUserLocationUseCase();
      location.fold((failure){
        emit(LocationError(failure.toString()));
      },
          (success){
            emit(UserLocationLoaded(userLocation: success));

          }
          );
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

 getLocations(pickupLocations){
  this.pickuplocations=pickupLocations;
  emit(LocationsLoaded(pickupLocations: pickupLocations));
  /* emit(LocationLoading());
   print('get loading......');
   try {
     final locations = await getPickupLocationsUsecase(carId);
     locations.fold((failure){
       print('failure');
     emit(LocationError(failure.toString()));
   },
             (success){

     emit(LocationsLoaded(pickupLocations: success));
             }
     );
   } catch (e) {
     emit(LocationError(e.toString()));
   }*/
  }
  selectedLocation(selectedLocation)async{
    try{
      emit(LocationLoading());
     //await savePickupLocationUsecase.call(selectedLocation);
      emit(SelectedLocation(selectedLocation: selectedLocation));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }
}
