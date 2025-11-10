import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CarInformationWidget extends StatelessWidget {
 const  CarInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<CarDetailsCubit,CarDetailsState>
       (builder: (context,state){
final car=context.read<CarDetailsCubit>().car;
      return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      child: RPadding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s8.r),
                child:     CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: car!.imagesUrl[0],
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
            ),
            const RSizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.name,
                      style: Theme.of(context).textTheme.headlineLarge
                  ),
                  const RSizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: ColorManager.green, size: AppSize.s16),
                      const SizedBox(width: 4),
                      Text(
                        '${car.rate.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.displayMedium                      ),
                      const RSizedBox(width: 8),
                      Text(
                        '• ${car.trips} Trips',
                          style: Theme.of(context).textTheme.titleMedium
                      ),
                    ],
                  ),
                  const RSizedBox(height: 8),
                  Text(
                    '\$${car.price.toStringAsFixed(2)}/h',
                      style: Theme.of(context).textTheme.displayMedium
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );});

  }
}
