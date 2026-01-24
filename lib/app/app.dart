import 'dart:async';

import 'package:car_rental/core/network/check_network_connectivity.dart';
import 'package:car_rental/features/booking/presentation/view/pages/select_location.dart';
import 'package:car_rental/features/booking/presentation/view/pages/time_select.dart';
import 'package:car_rental/features/driver_information/presentation/pages/approved_page.dart';
import 'package:car_rental/features/home/data/data_source/brand_data_source/brand_remote_data_source.dart';
import 'package:car_rental/features/home/data/data_source/cars_data_source/car_remote_data_source.dart';
import 'package:car_rental/features/home/data/repositories/brand_repository_implement.dart';
import 'package:car_rental/features/home/data/repositories/cars_repository_implement.dart';
import 'package:car_rental/features/home/domain/repositories/brand_repository.dart';
import 'package:car_rental/features/home/domain/usecases/get_brands_usecase.dart';
import 'package:car_rental/features/home/presentation/view_model/providers/brand_provider.dart';
import 'package:car_rental/features/home/presentation/view_model/providers/car_provider.dart';
import 'package:car_rental/features/host/presentation/view/pages/host_home_page.dart';
import 'package:car_rental/features/host/presentation/view/widgets/test_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../core/resources/theme_manager.dart';
import '../core/routes/app_router.dart';
import '../features/home/domain/usecases/get_cars_usecase.dart';
import '../features/home/presentation/view/pages/home_page.dart';
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) =>
            MyApp());
  }
}

  class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {
  @override
  void initState() {
  // TODO: implement initState
  super.initState();
  checkConnectivity();
  }
  checkConnectivity()async{
    await NetworkConnectivity.checkInitialConnectivity();

  }
  @override
  Widget build(BuildContext context) {
  return  MaterialApp(
    debugShowCheckedModeBanner: false,
  title: 'Flutter Demo',
  theme: getApplicationTheme(),
/*home:ChangeNotifierProvider<CarProvider>(
  create: (context) => CarProvider(
    GetCarsUsecase(
      CarsRepositoryImplement(
        CarRemoteDataSource(),
      ),
    ),
  ),
*/
    //child:  ApprovedPage()
    initialRoute: AppRouter.homeRoute,
    onGenerateRoute: AppRouter.onGenerateRoute,
);
  }


  }


