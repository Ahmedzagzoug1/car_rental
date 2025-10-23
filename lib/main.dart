import 'dart:async';

import 'package:car_rental/app/my_app.dart';
import 'package:car_rental/core/observer/bloc_obsorver.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

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
  runApp(const MyApp());
}
initHive()async{
  await Hive.initFlutter();

  Hive.registerAdapter(TimeModelAdapter());
  Hive.registerAdapter(PickupLocationModelAdapter());

  final timeBox = await Hive.openBox<TimeModel>('bookingBox');
  final locationBox = await Hive.openBox<PickupLocationModel>('location');
  sl.registerLazySingleton<Box<TimeModel>>(() => timeBox);

  sl.registerLazySingleton<Box<PickupLocationModel>>(() => locationBox);
}