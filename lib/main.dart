import 'dart:async';

import 'package:car_rental/app/my_app.dart';
import 'package:car_rental/core/observer/bloc_obsorver.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/core/shared_components/data/models/car_model.dart' hide CarModel;
import 'package:car_rental/features/booking/data/model/host_model.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'features/booking/data/model/car_model.dart';
import 'features/booking/data/model/time_model.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //init firebase
  final start = DateTime.now();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Firebase initialized in: ${DateTime.now().difference(start).inMilliseconds} ms");
  } else {
    print(" Firebase already initialized");
  }
  //init Hive
  await initHive();

// init getIt
  ServicesLocators().init();
  //bloc observer
  Bloc.observer=AppBlocObserver();
  //hydrated cubit
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(const MyApp(),);
}
initHive()async{
  await Hive.initFlutter();

  Hive.registerAdapter(TimeModelAdapter());
  Hive.registerAdapter(PickupLocationModelAdapter());
  Hive.registerAdapter(CarModelAdapter());
  Hive.registerAdapter(HostModelAdapter());

  final timeBox = await Hive.openBox<TimeModel>('bookingBox');
  final locationBox = await Hive.openBox<PickupLocationModel>('location');
  final carBox = await Hive.openBox<CarModel>('carBox');
  final HostBox = await Hive.openBox<HostModel>('hostBox');

  sl.registerLazySingleton<Box<TimeModel>>(() => timeBox);

  sl.registerLazySingleton<Box<PickupLocationModel>>(() => locationBox);
  sl.registerLazySingleton<Box<CarModel>>(() => carBox);

  sl.registerLazySingleton<Box<HostModel>>(() => HostBox);
}
