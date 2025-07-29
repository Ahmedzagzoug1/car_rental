import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/features/home/data/models/brand_model.dart';
import 'package:car_rental/features/home/presentation/view/widgets/BrandWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTopBrandList extends StatelessWidget {
  const CustomTopBrandList({super.key});

  @override
  Widget build(BuildContext context) {
    final topBrands=BrandModel.AllBrands;
    return SizedBox(
      height: AppSize.s96.sp,
      child: ListView.builder(itemCount: topBrands.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
        return Brandwidget(topBrandModel: topBrands[index],);
      }),
    );
  }
}
