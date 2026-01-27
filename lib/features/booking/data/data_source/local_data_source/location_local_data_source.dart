import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:hive/hive.dart';

abstract class LocationLocalDataSource {
  Future<void> saveLocation(PickupLocationModel locationModel);

  PickupLocationModel getLocation();
  Future<void> clearLocation();
}

class LocationLocalDataSourceImpl implements LocationLocalDataSource {
  final Box<PickupLocationModel> box;

  LocationLocalDataSourceImpl({ required this.box});

  static const String key = 'locations';

  @override
  Future<void> saveLocation(PickupLocationModel locationModel) async {
    await box.put(key, locationModel);
  }

  @override
  PickupLocationModel getLocation() {
    try {
      final PickupLocationModel pickupLocationModel= box.get(key)!;
      return pickupLocationModel;

    }on OfflineException{
      throw OfflineException();
    }
  }

  @override
  Future<void> clearLocation() async {
    await box.delete(key);
  }
}
