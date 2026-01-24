
import 'package:car_rental/core/shared_components/domain/usecase.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/domain/usecases/get_cars_usecase.dart';
import 'package:flutter/foundation.dart';

enum CarState { initial, loading, loaded, error }

class CarProvider with ChangeNotifier {
  final GetCarsUsecase _getCarsUsecase;

  CarState _state = CarState.initial;
  List<CarEntity> _cars = [];
  String _errorMessage = '';

  CarProvider(this._getCarsUsecase){
   fetchCars();
  }

  CarState get state => _state;
  List<CarEntity> get cars => _cars;
  String get errorMessage => _errorMessage;

  Future<void> fetchCars() async {
    _state = CarState.loading;
    print('start car provider-----');
    notifyListeners();

    try {
      _cars= (await _getCarsUsecase.call(NoParams())).fold(    (failure) {
        print('Folded Failure: ${failure.toString()}');
        return []; // Default value on failure
      },
            (successValue) {
          print('Folded Success: $successValue');
          return successValue;
        },) ;
      _state = CarState.loaded;
print('${_cars.length}');
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _state = CarState.error;
    } finally {
      notifyListeners();
    }
  }
}