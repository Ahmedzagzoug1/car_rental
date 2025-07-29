import 'package:car_rental/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/value_manager.dart';
class BottomWidget extends StatelessWidget {
  final String btn_text;
  final String price;
  final String subtitle;
  void Function()? onPressed;
  BottomWidget({super.key, required this.price, required this.subtitle,
    required this.btn_text, onPressed});

  @override
  Widget build(BuildContext context) {
  return  Container(

      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.only(topLeft:Radius.circular(AppSize.s35.r)
    ,topRight: Radius.circular(AppSize.s35.r) )
      ),
    child: Stack(
            children: [
      Positioned(
        left: 16,
        top: 12,
        child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(AppSize.s35.r)
        ,topRight: Radius.circular(AppSize.s35.r) ),
         color: ColorManager.black,

        )
        ,          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        price,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                          subtitle,
                          style: Theme.of(context).textTheme.displayMedium
                      ),
                    ],
                  ),
                ),
      ),   // Book Now button
              Positioned(
                right: 20,
                top: 20,
                child: ElevatedButton(
                  onPressed: onPressed,

                /*  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.green, // Green button color
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                  ),*/
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    child: Text(
                      btn_text,
                      style:Theme.of(context).textTheme.labelMedium ,
                    ),
                  ),),
              )
            ],
          ),
  );
  }
}