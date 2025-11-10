
import 'package:car_rental/features/booking/data/model/car_model.dart';
import 'package:hive/hive.dart';

abstract class CarLocalDataSource {
  Future<CarModel?> getCachedCar(carId);
  Future<void> cacheCar(CarModel carModel);
}


class CarLocalDataSourceImpl implements CarLocalDataSource {
  final Box<CarModel> carBox;

  CarLocalDataSourceImpl({required this.carBox});

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
}
