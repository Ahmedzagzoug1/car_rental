import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/value_manager.dart';
class BottomWidget extends StatelessWidget {
  final String btnText;
  final String price;
  final String subtitle;
  void Function()? onPressed;
  BottomWidget({super.key, required this.price, required this.subtitle,
    required this.btnText, onPressed});

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
        child: Column(
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
       // button
              Positioned(
                right: 20,
                top: 20,
                child: SizedBox(
                  height: 51.h,
                  width: 195.w,
                  child: ElevatedButton(
                    onPressed: onPressed,


                    style: Theme.of(context).elevatedButtonTheme.style,
                    child:  Center(
                      child: Text(
                        btnText,
                        style:Theme.of(context).textTheme.labelMedium ,
                      ),
                    ),),
                ),
              )
            ],
          ),
  );
  }
}