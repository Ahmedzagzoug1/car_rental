

import 'package:car_rental/core/resources/style_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // main colors
      primaryColor: ColorManager.primary,

      disabledColor: ColorManager.black,

      // button theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),

        highlightColor: ColorManager.green,
        focusColor: ColorManager.green,
        buttonColor: ColorManager.primary,
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(

          style: ElevatedButton.styleFrom(
              textStyle: getSemiBoldStyle(
                color: ColorManager.white,
                fontSize: FontSize.s13.sp,

              ),
backgroundColor: ColorManager.green,

              foregroundColor: ColorManager.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s16.sp)))),

      // text theme
      textTheme: TextTheme(
          headlineLarge: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s15.sp),
          headlineMedium: 
              getRegularStyle(color: ColorManager.black, fontSize: FontSize.s15.sp),
displayMedium: getRegularStyle(fontSize: FontSize.s13.sp, color: ColorManager.Gray),
          displayLarge:
              getRegularStyle(color: ColorManager.white, fontSize: FontSize.s12.sp),
          bodyLarge: getSemiBoldStyle( color: ColorManager.black,fontSize: FontSize.s15.sp),
          labelMedium: getSemiBoldStyle(color: ColorManager.white,fontSize: FontSize.s15.sp),
        labelLarge: getMediumStyle(fontSize:  FontSize.s13.sp, color: ColorManager.white)
          ),
      // input decoration theme (text form field)
inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),

        // hint style
        hintStyle:
            getRegularStyle(color: ColorManager.Gray, fontSize: FontSize.s15),
        labelStyle:
            getMediumStyle(color: ColorManager.black, fontSize: FontSize.s15),
        errorStyle: getRegularStyle(color: ColorManager.error,fontSize: FontSize.s15.sp),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.black, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
      );
}
