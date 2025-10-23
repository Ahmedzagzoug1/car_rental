import 'package:bloc/bloc.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/core/shared_components/domain/usecase.dart';
import 'package:car_rental/features/home/data/data_source/cars_data_source/car_remote_data_source.dart';
import 'package:car_rental/features/home/data/repositories/cars_repository_implement.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/domain/usecases/get_cars_usecase.dart';
import 'package:equatable/equatable.dart';

part 'cars_home_state.dart';

class CarsHomeCubit extends Cubit<CarsHomeState> {
  late List<CarHomeEntity> cars;
 late final CarHomeEntity selectedCar;
  CarsHomeCubit() : super(CarsHomeInitial());
  getCars() async {
    emit(CarsHomeLoading());
    try {
    final result   =await sl<GetCarsUsecase>().call();

   cars=    result .fold((failure) {
        print('Folded Failure: ${failure.toString()}');
        return []; // Default value on failure
      },
            (successValue) {
          print('Folded Success: $successValue');
          return successValue;
        },);
      print('${cars.length}');

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
