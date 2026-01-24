import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/features/home/data/models/brand_model.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Brandwidget extends StatelessWidget {
  final BrandEntity brandEntity;
   Brandwidget({super.key,required this.brandEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TODO add card or shadow

        CircleAvatar(
          backgroundColor: ColorManager.white,
          radius: AppSize.s35.sp,
       child: RPadding(padding: const EdgeInsets.all( AppPadding.p8)

             ,  child: CachedNetworkImage(imageUrl:  brandEntity.imageSrc,

           errorWidget:(context, error,child)=> Center(child: Text(error,))
           ))),

        const RSizedBox.vertical(AppSize.s4),
     Text(brandEntity.brandName, style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}
