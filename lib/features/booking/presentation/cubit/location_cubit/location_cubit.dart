import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/domain/usecases/get_pickup_locations_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/get_user_location.dart';
import 'package:car_rental/features/booking/domain/usecases/save_pickup_location_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetUserLocationUseCase getUserLocationUseCase;
final GetPickupLocationsUsecase getPickupLocationsUsecase;
final SavePickupLocationUsecase savePickupLocationUsecase;

  late PickupLocationEntity userLocation;
  late List< PickupLocationEntity> pickupLocations;

  LocationCubit({required this.getUserLocationUseCase,
  required this.savePickupLocationUsecase,required this.getPickupLocationsUsecase
  }) : super(LocationInitial());

 getCurrentLocation() async {
    emit(LocationLoading());
    try {
      final location = await getUserLocationUseCase();
      location.fold((failure)=>failure,
          (success)=>success
          );
      emit(LocationLoaded());
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

 getLocations(carId)async{
   emit(LocationLoading());
   try {
     final locations = await getPickupLocationsUsecase(carId);
   pickupLocations=  locations.fold((failure){
     print('failure');
     return [];
   },
             (success){
     return success as List<PickupLocationEntity>;
             }
     );
     emit(LocationLoaded());
   } catch (e) {
     emit(LocationError(e.toString()));
   }
  }
  saveLocation(pickupLocationEntity)async{
    try{
      emit(LocationLoading());
     await savePickupLocationUsecase.call(pickupLocationEntity);
     emit(LocationLoaded());
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }
}
