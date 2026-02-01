import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:car_rental/core/shared_components/data/models/host_model.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:car_rental/features/booking/data/model/time_model.dart';
import 'package:car_rental/features/home/data/models/brand_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hive_adapters.dart';
import 'hive_config.dart';


Future<void> initHive() async {
  await Hive.initFlutter();
  registerHiveAdapters();

  var metaBox = await Hive.openBox<int>('__meta__');
  final savedVersion = metaBox.get('version');

  if (savedVersion != HiveConfig.hiveVersion) {
    await Hive.deleteFromDisk();

    // لازم تعيد فتح الـ metaBox بعد المسح
    metaBox = await Hive.openBox<int>('__meta__');
    await metaBox.put('version', HiveConfig.hiveVersion);
  }
  // افتح باقي الـ Boxes
  final timeBox = await Hive.openBox<TimeModel>('timeBox');
  final locationBox =
  await Hive.openBox<PickupLocationModel>('locationBox');
  final hostBox = await Hive.openBox<HostModel>('hostBox');
  final carBox = await Hive.openBox<CarModel>('cars');
  final brandBox = await Hive.openBox<BrandModel>('brands');
  final cacheMetaBox = await Hive.openBox<int>('cacheMeta');
  print('start  register hive????????????????????????????????????????');

  // سجل في GetIt
  sl.registerLazySingleton<Box<TimeModel>>(() => timeBox);
  sl.registerLazySingleton<Box<PickupLocationModel>>(() => locationBox);
  sl.registerLazySingleton<Box<HostModel>>(() => hostBox);
  sl.registerLazySingleton<Box<CarModel>>(() => carBox);
  sl.registerLazySingleton<Box<BrandModel>>(() => brandBox);
  sl.registerLazySingleton<Box<int>>(() => cacheMetaBox);
  print('finish  register hive????????????????????????????????????????');

}
