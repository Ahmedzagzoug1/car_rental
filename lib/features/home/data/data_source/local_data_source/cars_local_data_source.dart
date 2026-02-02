
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:hive/hive.dart';

import 'package:car_rental/core/error/exceptions.dart';
abstract class CarsLocalDataSource {
  Future<List<CarModel>> getCachedCars();
  Future<void> cacheCars(List<CarModel> cars);

  Future<CarModel?> getCachedCar(carId);
  Future<void> cacheCar(CarModel carModel);
  Future<int> getLastCacheTimestamp();
}


class CarsLocalDataSourceImpl implements CarsLocalDataSource {
  final Box<CarModel> carBox;
  final Box carsCacheBox;

  static const _carsCacheTimeKey = 'CARS_CACHE_TIME';
  CarsLocalDataSourceImpl({required this.carBox, required this.carsCacheBox});

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
    await carsCacheBox.put(
      _carsCacheTimeKey,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  @override
  Future<List<CarModel>> getCachedCars() async {

    return carBox.values.toList();
  }
  @override
  Future<int> getLastCacheTimestamp() async {
    return carsCacheBox.get(_carsCacheTimeKey, defaultValue: 0);
  }
}