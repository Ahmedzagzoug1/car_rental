import 'dart:async';

import 'package:car_rental/features/booking/view/widgets/map_widget.dart';
import 'package:car_rental/features/home/view/pages/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/resources/theme_manager.dart';
void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  String assetPath = 'assets/langs/ar-EG.json'; // Or however you construct this path
  print('Attempting to load asset: $assetPath');
  try {
    String jsonString = await rootBundle.loadString(assetPath);
    // ...
  } catch (e) {
    print('Error loading asset $assetPath: $e'); // This will give you the error again
  }
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => EasyLocalization(
        child: MyApp(),
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/langs',

    )));}

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
    return  MaterialApp(
      title: 'Flutter Demo',
      theme: getApplicationTheme(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home:const HomePage(),
    );
  }
}
