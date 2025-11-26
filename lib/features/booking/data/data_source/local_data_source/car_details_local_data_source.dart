
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

abstract class CarDetailsLocalDataSource {
  Future<CarModel?> getCachedCar(carId);
  Future<void> cacheCar(CarModel carModel);
}


class CarDetailsLocalDataSourceImpl implements CarDetailsLocalDataSource {
  final Box<CarModel> carBox;

  CarDetailsLocalDataSourceImpl({required this.carBox});

  @override
  Future<void> cacheCar(CarModel car) async {
    await carBox.clear();
   await carBox.put(car.id, car);
  }

  @override
  Future<CarModel?> getCachedCar(carId) async {
    debugPrint('${carId} getcache');
     final car= await carBox.get(carId);
      print('${car!.price} in the cache' );
      return car;
  }

  @override
  Future<void> clearCachedCars() async {
    await carBox.clear();
  }

}
