
import 'package:car_rental/app/my_app.dart';
import 'package:car_rental/core/cache/hive/hive_initializer.dart';
import 'package:car_rental/core/observer/bloc_obsorver.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/features/booking/data/model/host_model.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:car_rental/features/home/data/models/brand_model.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'features/booking/data/model/time_model.dart';
import 'features/home/data/models/car_model.dart';
import 'firebase_options.dart';
void main() async {
   WidgetsFlutterBinding.ensureInitialized();

 await  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform) ;
  await initHive();

// init getIt
  await ServicesLocators().init();
  //bloc observer
  Bloc.observer=AppBlocObserver();

  runApp(const MyApp(),);
}
//eyJvcmciOiI1YjNjZTM1OTc4NTExMTAwMDFjZjYyNDgiLCJpZCI6IjViZWIzNTM5MTE0NDRhYTdhOWIxMDQwNDJhODAzNDBiIiwiaCI6Im11cm11cjY0In0=