import 'package:bloc/bloc.dart';
import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/domain/repositories/booking_repository.dart';
import 'package:car_rental/features/booking/domain/usecases/get_car_details.dart';
import 'package:equatable/equatable.dart';

part 'car_details_state.dart';

class CarDetailsCubit extends Cubit<CarDetailsState> {
   CarDetailsEntity? car;
   String? _carId;




   CarDetailsCubit() : super(CarDetailsInitial());
   void setCarId(String id) {
     _carId = id;
   }
  getCarDetails(String carId)async{

    emit(CarDetailsLoading());
    try {
      print(carId);
      final result   =await sl<GetCarDetailsUseCase>().call(carId);

       car=    result .fold(  (failure) {
         emit(CarDetailsFailure(errMessage: failure.toString()));
         return null;
       },
            (successValue) {
          print('Folded Success: $successValue');
          return successValue;
        },);

      if (car != null) {
        emit(CarDetailsLoaded(carDetailsEntity: car!));
      } else {
        emit(CarDetailsFailure(errMessage: 'Car data is null'));
      }    } catch (e) {
      emit(CarDetailsFailure(errMessage: e.toString()));
    }
  }
}
