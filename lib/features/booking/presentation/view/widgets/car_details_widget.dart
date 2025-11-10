import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CarDetailsWidget extends StatelessWidget {
  const CarDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarDetailsCubit, CarDetailsState>(
  builder: (context, state) {
    final car=context.read<CarDetailsCubit>().car;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(car!.name,style: Theme.of(context).textTheme.headlineLarge,),
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
  },
);
  }
}
