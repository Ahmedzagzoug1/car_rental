import 'package:car_rental/features/booking/domain/entities/location_entity.dart';
import 'package:car_rental/features/booking/domain/usecases/get_user_location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetUserLocationUseCase getUserLocationUseCase;

  LocationCubit(this.getUserLocationUseCase) : super(LocationInitial());

  Future<void> getCurrentLocation() async {
    emit(LocationLoading());
    try {
      final location = await getUserLocationUseCase();
      emit(LocationLoaded(location as LocationEntity));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }
}
