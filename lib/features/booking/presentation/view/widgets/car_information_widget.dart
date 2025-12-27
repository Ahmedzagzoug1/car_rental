import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
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
         if(state is CarDetailsLoaded){
final car=state.carDetailsEntity;
      return SizedBox(
        height: AppSize.s53,
        child: Row(
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.name,
                        style: Theme.of(context).textTheme.titleLarge
                    ),
                    const RSizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: ColorManager.green, size: AppSize.s16),
                        const SizedBox(width: 4),
                        Text(
                          car.rate.toStringAsFixed(2),
                            style: Theme.of(context).textTheme.displayMedium                      ),
                        Text(
                          '• ${car.trips} Trips',
                            style: Theme.of(context).textTheme.displayMedium
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              Text(
                  '\$${car.price.toStringAsFixed(2)}/h',
                  style: Theme.of(context).textTheme.titleLarge
              ),
            ],),
      );}else if(state is CarDetailsLoading){
           return const CircularProgressIndicator();
         }else{
           return const Text('there is an expected error');
         }

      });

  }
}
