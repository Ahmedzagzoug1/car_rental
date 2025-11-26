import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/presentation/view/widgets/car_item_widget.dart';
import 'package:car_rental/features/home/presentation/cubit/cars_home_cubit/cars_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomCarsListview extends StatelessWidget {
  const CustomCarsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsHomeCubit,CarsHomeState>(
        builder: (context,state) {
          if (state is CarsHomeInitial) {
            return Text('start Loading data');
          }
          else if (state is CarsHomeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CarsHomeLoaded) {
            List<CarHomeEntity>cars = state.cars;


            return SizedBox(
              height: AppSize.s206.sp,
              child: ListView.builder(itemCount: cars.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CarItemWidget(
                    carEntity: cars[index],);
                },),);
          } else  {
            return Text('${(state as CarsHomeFailure).errmessage}');
          }
        }
          );
          }
        }




