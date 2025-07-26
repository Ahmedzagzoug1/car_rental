import 'dart:async';

import 'package:car_rental/features/booking/view/pages/select_location.dart';
import 'package:car_rental/features/booking/view/pages/time_select.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/resources/theme_manager.dart';
import '../core/routes/app_router.dart';
import '../features/home/view/pages/home_page.dart';
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
  Timer(const Duration(seconds: 1), (){
  FlutterNativeSplash.remove();
  });
  }
  @override
  Widget build(BuildContext context) {
  return  MaterialApp(
    debugShowCheckedModeBanner: false,
  title: 'Flutter Demo',
  theme: getApplicationTheme(),

    initialRoute: AppRouter.homeRoute,
    onGenerateRoute: AppRouter.onGenerateRoute,
  );
  }
  }


