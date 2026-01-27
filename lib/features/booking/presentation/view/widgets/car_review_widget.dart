import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/features/booking/presentation/cubit/booking_cubit/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CarReviewWidget extends StatelessWidget {
  const CarReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
  builder: (context, state) {
    if (state is BookingUpdated) {
      final car = context.read<BookingCubit>().selectedCar;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
   // mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(height: 100.h,width: 110.w,
      child: Align(
        alignment: Alignment.topCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2.r),
          child: Image.network(car!.imagesUrl.first),

        ),
      ),),
    SizedBox(width: 4.r,),
    SizedBox(
      height: 100.h,
      width: 113.w,
      child: Column(
      children: [
      Text(car.name,style: Theme.of(context).textTheme.labelSmall,),
      Row(
      children: [
      Icon(Icons.star,color: ColorManager.green,),
      Text('${car.rate} . ${car.trips} trips',
      style: Theme.of(context).textTheme.headlineLarge,),

      ],
      ),
        RSizedBox(height: 8,),
        Text('\$ ${car.price} /h',style: Theme.of(context).textTheme.bodyMedium, )

      ],
      ),
    ),
    ],
    );
    }else{
      return const Text('unexpected error');
    }

  }
);
  }
}
