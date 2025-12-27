import 'package:bloc/bloc.dart';

import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/domain/usecases/get_cars_usecase.dart';
import 'package:equatable/equatable.dart';

part 'cars_home_state.dart';

class CarsHomeCubit extends Cubit<CarsHomeState> {
  late List<CarHomeEntity> cars;
 late final CarHomeEntity selectedCar;
  final GetCarsUsecase getCarsUsecase;

 CarsHomeCubit({required this.getCarsUsecase}) : super(CarsHomeInitial());
  getCars() async {
    emit(CarsHomeLoading());
    try {
    final result   =await getCarsUsecase.call();

   cars=    result .fold((failure) {
        print('Folded Failure: ${failure.toString()}');
        return [];
      },
            (successValue) {
          print('Folded Success: $successValue');
          return successValue;
        },);

      emit(CarsHomeLoaded(cars: cars));
    } catch (e) {
      emit(CarsHomeFailure(e.toString()));
      print(e.toString());
      //  return [];
    }
  }
  sendCar(String carId){
    try {
      selectedCar = cars.firstWhere((car) => car.id == carId);
      emit(CarSelectedState(selectedCar));
    }catch(e){
      emit(CarsHomeFailure(e.toString()));
    }
  }

}
