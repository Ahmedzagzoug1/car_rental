import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/features/booking/presentation/cubit/trip_date_cubit/trip_date_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/date_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TripHeaderInfo extends StatelessWidget {
  const TripHeaderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripDateCubit, TripDateState>(
      builder: (context, state) {
        return Container(
          color: ColorManager.emeraldGreen05,
          padding: EdgeInsets.all(20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DateColumn(date: state.timeEntity.pickupDate, time: state.timeEntity.pickupTime),
              Icon(Icons.arrow_forward, color: ColorManager.black),
              DateColumn(date: state.timeEntity.returnDate, time: state.timeEntity.returnTime),
            ],
          ),
        );
      },
    );
  }
}