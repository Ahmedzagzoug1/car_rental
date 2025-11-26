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
    if (state is CarDetailsLoaded) {
      final car = state.carDetailsEntity;

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
    }else if(state is CarDetailsLoading){
      return CircularProgressIndicator(color: ColorManager.green,);
    }else{
      return Text('${(state as CarDetailsFailure).errMessage}');
    }

  }
);
  }
}
