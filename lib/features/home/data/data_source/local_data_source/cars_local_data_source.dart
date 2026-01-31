
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:hive/hive.dart';

import '../../../../../core/error/exceptions.dart';

abstract class CarsLocalDataSource {
  Future<List<CarModel>> getCachedCars();
  Future<void> cacheCars(List<CarModel> cars);

  Future<CarModel?> getCachedCar(carId);
  Future<void> cacheCar(CarModel carModel);
}


class CarsLocalDataSourceImpl implements CarsLocalDataSource {
  final Box<CarModel> carBox;

  CarsLocalDataSourceImpl({required this.carBox});

  @override
  Future<void> cacheCar(CarModel car) async {
    await carBox.put(car.id, car);
  }

  @override
  Future<CarModel?> getCachedCar(carId) async {
    final car = carBox.get(carId);
    if (car != null) return car;
    throw NotFoundException();
  }

  @override
  Future<void> cacheCars(List<CarModel> cars) async {
    await carBox.clear();
    final Map<dynamic, CarModel> carMap = {
      for (var car in cars) car.id: car
    };
    await carBox.putAll(carMap);
  }

  @override
  Future<List<CarModel>> getCachedCars() async {
    if (carBox.isEmpty) {
      throw EmptyCacheException();
    }
    return carBox.values.toList();
  }
}