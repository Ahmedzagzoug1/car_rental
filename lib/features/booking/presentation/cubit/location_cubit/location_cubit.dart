import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/domain/usecases/get_pickup_locations_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/get_user_location.dart';
import 'package:car_rental/features/booking/domain/usecases/save_pickup_location_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetUserLocationUseCase getUserLocationUseCase;


late final List<PickupLocationEntity> pickuplocations;
  LocationCubit({required this.getUserLocationUseCase,

  }) : super(LocationInitial());


 getCurrentLocation() async {
    emit(LocationLoading());
    try {
      final location = await getUserLocationUseCase();
      location.fold((failure){
        emit(LocationError(failure.toString()));
      },
          (success){
            emit(UserLocationLoaded(userLocation: success));
pickuplocations=success as List<PickupLocationEntity>;
          }
          );
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

  selectedLocation(selectedLocation)async{
    try{
      emit(SelectedLocation(selectedLocation: selectedLocation));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }
}
