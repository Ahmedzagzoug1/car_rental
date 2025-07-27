import 'package:car_rental/core/resources/assets_manager.dart';
import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {

    return RPadding(
      padding:const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text('Car Rental',style: Theme.of(context).textTheme.labelLarge,),
          Row(
                  children: [

                    Container(
                      width: 95.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        border:Border.all(color: ColorManager.black,width: AppSize.s1_5.r,
                        ),
                        borderRadius: BorderRadius.circular(AppSize.s16.r),

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(ImageAssets.tree,height: 20.r,width: 20.r,
                          ),
                          Text('200',style: Theme.of(context).textTheme.headlineMedium,)
                        ],

                      ),
                    ),
                    Image.asset(ImageAssets.profileImage,height: 36.h,
                      width: 32.w,),
                  ],
                ),
        ],
      ),
    );
  }
}
