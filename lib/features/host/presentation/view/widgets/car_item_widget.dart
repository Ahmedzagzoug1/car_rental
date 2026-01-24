import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CarItemWidget extends StatelessWidget {
  final CarModel car;
  CarItemWidget({super.key,required this.car});

  @override
  Widget build(BuildContext context) {
    return     InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRouter.carDetailsRoute).then((v){
          print('suessfully-------------------------------------------------');

        });
      },
      child: Container(
        margin: EdgeInsets.only(right: AppMargin.m20.r),
        width: AppSize.s227.sp,
        height: AppSize.s206.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s16.sp),
          color: Colors.white,
          boxShadow: [BoxShadow(color: ColorManager.black, blurRadius: AppSize.s1_5.sp)],
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: AppSize.s100.sp,//increase height
                    width:AppSize.s227.sp ,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSize.s16)),
                      child: /*Image.network(
          car.image,
          height: AppSize.s60.sp,
          width:AppSize.s227.sp ,
          fit: BoxFit.fill,
          ),*/
                      CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: car.image,
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Positioned(
                    right: AppSize.s12.sp,
                    top: AppSize.s12.sp,
                    child: CircleAvatar(backgroundColor: ColorManager.Gray,
                        child : Center(child: Icon(Icons.favorite_border, color:ColorManager.white,))),
                  )
                ],
              ),
              RPadding(
                padding:EdgeInsets.all( AppSize.s12.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(car.name, style: Theme.of(context).textTheme.bodyLarge),
                        Row(
                          children: [
                            Icon(Icons.star, color: ColorManager.green, size: AppSize.s16.sp),
                            Text(car.rate.toString()),
                          ],
                        ),

                      ],
                    ),
                    const RSizedBox.vertical(AppSize.s4),
                    Text(car.availability, style: Theme.of(context).textTheme.displayMedium),
                    const  RSizedBox.vertical(AppSize.s4),
                    Row(
                      children: [
                        Icon(Icons.event_seat, size:AppSize.s14.sp, color: Colors.green),
                        const   RSizedBox.horizontal(AppSize.s4),
                        Text("4 Seats", style: Theme.of(context).textTheme.bodyLarge),
                        const Spacer(),
                        Icon(Icons.attach_money, color: Colors.green, size:AppSize.s14.sp),
                        Text("${car.price}/hour", style:  Theme.of(context).textTheme.bodyLarge),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );


  }
}
