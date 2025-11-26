
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:hive/hive.dart';

abstract class CarsLocalDataSource {
  Future<List<CarModel>> getCachedCars();
  Future<void> cacheCars(List<CarModel> cars);

  Future<CarModel?> getCachedCar(carId);
  Future<void> cacheCar(CarModel carModel);
}


class CarsLocalDataSourceImpl implements CarsLocalDataSource {
  final Box<CarModel> carBox;

  CarsLocalDataSourceImpl( {required this.carBox});

  @override
  Future<void> cacheCar(CarModel car) async {
    await carBox.clear();
   await carBox.put(car.id, car);
  }

  @override
  Future<CarModel?> getCachedCar(carId) async {
    return  carBox.get(carId);
  }

  @override
  Future<void> clearCachedCars() async {
    await carBox.clear();
  }

  @override
  Future<void> cacheCars(List<CarModel> cars) async {
    await carBox.clear();
    for (final car in cars) {
      await carBox.put('${car.id}', car);
    }
  }

  @override
  Future<List<CarModel>> getCachedCars() async{
    print('cached car...');
    return carBox.isEmpty ? [] : carBox.values.toList();
  }
}
