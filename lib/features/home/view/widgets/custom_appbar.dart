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
          SizedBox(
            width: 121.w,
            height: 32.h,
            child: Row(
              children: [
Icon(CupertinoIcons.location_solid),
                Text('200',style: Theme.of(context).textTheme.headlineMedium,),
                Icon(CupertinoIcons.arrow_down)
              ],
            ),
          ),
          SizedBox(

            child: Row(
              children: [
                
                 Container(
                width: 69.w,
                height: 32.h,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(AppSize.s8.r),
                     boxShadow:[
                       BoxShadow(color: ColorManager.black,
                           offset: Offset(0, 0))
        ]
                   ),
                   child: Row(
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
          ),
        ],
      ),
    );
  }
}
