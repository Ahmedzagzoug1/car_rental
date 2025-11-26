import 'package:bloc/bloc.dart';

import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/domain/entities/host_entity.dart';
import 'package:car_rental/features/booking/domain/usecases/get_car_details.dart';
import 'package:car_rental/features/booking/domain/usecases/get_host_usecase.dart';
import 'package:equatable/equatable.dart';

part 'car_details_state.dart';

class CarDetailsCubit extends Cubit<CarDetailsState> {

final GetCarDetailsUseCase getCarDetailsUseCase;
   CarDetailsCubit(this.getCarDetailsUseCase) : super(CarDetailsInitial());
  loadCar(carId){
    getCarDetails(carId);
}


getCarDetails(String carId)async{
 emit(CarDetailsLoading());
    try {
      final result   =await getCarDetailsUseCase.call(carId);

           result .fold(  (failure){
         emit(CarDetailsFailure(errMessage:'there are $failure' ));
       },
            (successValue){
             emit(CarDetailsLoaded(carDetailsEntity: successValue));
            },);

       } catch (e) {
      emit(CarDetailsFailure(errMessage: e.toString()));
    }
  }


}
