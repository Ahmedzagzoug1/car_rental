import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/core/routes/app_router.dart';

import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CarItemWidget extends StatelessWidget {
  final CarHomeEntity carEntity;
  const CarItemWidget({super.key,required this.carEntity});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () async {
print('${carEntity.id} home');
        Navigator.pushNamed(context, AppRouter.carDetailsRoute,

            arguments:{'id':
            carEntity.id});

      },
      child: Container(
        margin: EdgeInsets.only(right: AppMargin.m16.r),
        width: AppSize.s227.w,
        height: AppSize.s206.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s16.sp),
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(color: ColorManager.black, blurRadius: AppSize.s1_5.sp)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: AppSize.s120.h,
                  width: AppSize.s227.w,

                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(AppSize.s16)),
                    child:        CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: carEntity.imageUrl,
                      progressIndicatorBuilder: (context, url,
                          downloadProgress) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  right: AppSize.s12.sp,
                  top: AppSize.s12.sp,
                  child: CircleAvatar(backgroundColor: ColorManager.grey,
                      child: Center(child: Icon(
                        Icons.favorite_border, color: ColorManager.white,))),
                )
              ],
            ),
            RPadding(
              padding: EdgeInsets.all(AppSize.s4.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(carEntity.name, style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge),
                      Row(
                        children: [
                          Icon(Icons.star, color: ColorManager.green,
                              size: AppSize.s16.sp),
                          Text(carEntity.rating.toString()),
                        ],
                      ),

                    ],
                  ),
                  Text(carEntity.availability, style: Theme
                      .of(context)
                      .textTheme
                      .displayMedium),
                  Row(
                    children: [
                      Icon(Icons.event_seat, size: AppSize.s14.sp,
                          color: Colors.green),
                      const RSizedBox.horizontal(AppSize.s4),
                      Text('4', style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge),
                      const Spacer(),
                      Icon(Icons.attach_money, color: Colors.green,
                          size: AppSize.s14.sp),
                      Text("${carEntity.price}/hour", style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );



  }
}
