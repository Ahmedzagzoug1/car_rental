import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/booking_cubit/booking_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
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
    mainAxisSize: MainAxisSize.min,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Image.network(car!.imagesUrl.first),
      ),
    SizedBox(width: 12.r,),
    Column(
    children: [
    Text(car.name,style: Theme.of(context).textTheme.headlineLarge,),
    Row(
    children: [
    Icon(Icons.star,color: ColorManager.green,),
    Text('${car.rate} . ${car.trips} trips',
    style: Theme.of(context).textTheme.displayMedium,),

    ],
    ),
    ],
    ),
    Text('\$ ${car.price} /h',style: Theme.of(context).textTheme.headlineLarge, )
    ],
    );
    }else{
      return const Text('unexpected error');
    }

  }
);
  }
}
