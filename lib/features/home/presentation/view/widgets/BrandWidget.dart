import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/features/home/data/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Brandwidget extends StatelessWidget {
  final BrandModel? topBrandModel;
   Brandwidget({super.key,this.topBrandModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TODO add card or shadow

        CircleAvatar(
          backgroundColor: ColorManager.white,
          radius: AppSize.s35.sp,
       child: RPadding(padding: const EdgeInsets.all( AppPadding.p8)

             ,  child: Image.asset(topBrandModel!.imageSrc))),

        const RSizedBox.vertical(AppSize.s4),
     Text(topBrandModel!.brandName, style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}
