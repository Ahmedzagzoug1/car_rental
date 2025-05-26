import 'dart:async';

import 'package:car_rental/features/authentication/view/signup.dart';
import 'package:car_rental/features/home/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => const MyApp(),
  ));}

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
    Timer(const Duration(seconds: 3), (){
      FlutterNativeSplash.remove();
    });
  }
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
