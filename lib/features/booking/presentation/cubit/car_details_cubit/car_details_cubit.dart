import 'package:bloc/bloc.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/domain/entities/host_entity.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/domain/usecases/get_car_details.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'car_details_state.dart';

class CarDetailsCubit extends Cubit<CarDetailsState> {
  final GetCarDetailsUseCase getCarDetailsUseCase;

  CarDetailsCubit(this.getCarDetailsUseCase) : super(CarDetailsInitial());
  Future<void> getCarDetails(String carId) async {
    emit(CarDetailsLoading());
    try {
   final result = await  getCarDetailsUseCase(carId);
result.fold((failure) => emit(CarDetailsError(failure.toString()),
), (carDetailsEntity)=>emit(CarDetailsLoaded(carDetailsEntity:carDetailsEntity))
    );
    } catch (e) {
      emit(CarDetailsError(e.toString()));
    }
  }
  String joinDateFromTimestamp(DateTime td) {
    final formatted = DateFormat('MMM yyyy').format(td);
    return "Joined $formatted";

  }
}
