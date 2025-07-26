import 'dart:async';

import 'package:car_rental/app/app.dart';
import 'package:car_rental/features/booking/view/widgets/map_widget.dart';
import 'package:car_rental/features/home/view/pages/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/resources/theme_manager.dart';
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await initializeDateFormatting('en_US', null);
  // For all available locales (can be heavy):
  // await initializeDateFormatting();

  String assetPath = 'assets/langs/ar-EG.json'; // Or however you construct this path
  print('Attempting to load asset: $assetPath');
  try {
    String jsonString = await rootBundle.loadString(assetPath);
    // ...
  } catch (e) {
    print(
        'Error loading asset $assetPath: $e'); // This will give you the error again
  }
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(App());
}