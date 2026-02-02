import 'package:car_rental/features/booking/data/model/host_model.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:car_rental/features/booking/data/model/time_model.dart';
import 'package:car_rental/features/home/data/models/brand_model.dart';
import 'package:hive/hive.dart';
import '../../../features/home/data/models/car_model.dart';

void registerHiveAdapters() {
  Hive.registerAdapter(TimeModelAdapter());
  Hive.registerAdapter(PickupLocationModelAdapter());
  Hive.registerAdapter(HostModelAdapter());
  Hive.registerAdapter(CarModelAdapter());
  Hive.registerAdapter(BrandModelAdapter());
}
