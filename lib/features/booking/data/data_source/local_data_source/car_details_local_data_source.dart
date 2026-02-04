
import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/features/booking/data/model/car_details_model.dart';
import 'package:car_rental/features/booking/data/model/host_model.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';

import 'package:hive/hive.dart';

abstract class CarDetailsLocalDataSource {
  //car
  Future<void> cacheCarDetails(String carId, CarDetailsModel carDetails);
  Future<CarDetailsModel> getCachedCarDetails(String carId);

 //  host
  Future<void> cacheHost(String carId, HostModel host);
   Future<HostModel> getCachedHost(String carId);

  //locations
  Future<void> cacheLocations(String carId, List<PickupLocationModel> locations);
  Future<List<PickupLocationModel>> getCachedLocations(String carId);

  //clear full cache
  Future<void> clearCache();
  }



class CarDetailsLocalDataSourceImpl implements CarDetailsLocalDataSource {
  final Box carDetailsBox;

  static const String _carDetailsPrefix = "car_details_";
  static const String _hostPrefix = "host_";
  static const String _locationPrefix = "locations_";

  CarDetailsLocalDataSourceImpl(this.carDetailsBox);

  @override
  Future<void> cacheHost(String carId, HostModel host) async {

    await carDetailsBox.put('$_hostPrefix$carId', host.toJson());
  }

  @override
  Future<HostModel> getCachedHost(String carId)async {
    try {
      final data = await carDetailsBox.get('$_hostPrefix$carId');
      if (data == null) throw NotFoundException();
        return HostModel.fromJson(Map<String, dynamic>.from(data));

    } catch (_) {
      throw NotFoundException();
    }
  }

  @override
  Future<void> cacheLocations(String carId, List<PickupLocationModel> locations) async {
    final List<Map<String, dynamic>> data = locations.map((e) => e.toJson()).toList();
    await carDetailsBox.put('$_locationPrefix$carId', data);
  }

  @override
  Future<List<PickupLocationModel>> getCachedLocations(String carId) async{
    try {
      final List<dynamic> data = await carDetailsBox.get(
          '$_locationPrefix$carId');
      if (data.isEmpty) throw NotFoundException();
      return data
          .map((e) =>
          PickupLocationModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }catch(_){
      throw NotFoundException();

    }
  }

  @override
  Future<void> clearCache() async {
    await carDetailsBox.clear();
  }

  @override
  Future<void> cacheCarDetails(String carId, CarDetailsModel carDetails) async{
  await carDetailsBox.put('$_carDetailsPrefix$carId', carDetails.toJson());
  }

  @override
  Future<CarDetailsModel> getCachedCarDetails(String carId) async{
    final data =await carDetailsBox.get('$_carDetailsPrefix$carId');
    if (data != null) {
      return CarDetailsModel.fromJson(Map<String, dynamic>.from(data));
    }
    throw NotFoundException();
  }
}
