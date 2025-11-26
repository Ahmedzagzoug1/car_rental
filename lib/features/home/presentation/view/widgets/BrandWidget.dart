import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/features/home/data/models/brand_model.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BrandWidget extends StatelessWidget {
  final BrandEntity brandEntity;
 const  BrandWidget({super.key,required this.brandEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [

          Container(
            decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ColorManager.black.withOpacity(0.08),
                offset: const Offset(0, 4),
                blurRadius: 12,
                spreadRadius: 1,
              ),
            ]),          child: CircleAvatar(

              backgroundColor: ColorManager.white,
              radius: AppSize.s40.sp,
                   child: RPadding(padding: const EdgeInsets.all( AppPadding.p8)

                 ,  child: CachedNetworkImage(imageUrl:  brandEntity.imageSrc,

               errorWidget:(context, error,child)=> Center(child: Text(error,))
               ))),
          ),

          const RSizedBox.vertical(AppSize.s4),
       Text(brandEntity.brandName, style: Theme.of(context).textTheme.headlineLarge,),
        ],
      ),
    );
  }
}
