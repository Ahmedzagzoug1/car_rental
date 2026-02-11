import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/features/booking/presentation/cubit/trip_date_cubit/trip_date_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/custom_calender.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/time_selector_section.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/trip_header_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripDataPage extends StatelessWidget {

  const TripDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: const Text("Select Trip Date & Time"),
            actions: [TextButton(onPressed: () {
              context.read<TripDateCubit>().reset();
            }, child: const Text("Reset"))],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const TripHeaderInfo(),
                const CustomCalendar(),
                const Divider(),
                const TimeSelectorSection(),
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primary,
                      minimumSize: Size(double.infinity, 50.h),
                    ),
                    onPressed: () {
                  print('save init');
                      final currentTimeState = context.read<TripDateCubit>().state;
                      if (currentTimeState is TripDateChanged || currentTimeState is TripDateInitial) {
                      print('saved');
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Save", style: Theme.of(context).textTheme.labelLarge),
                  ),
                )
              ],
            ),
          ),
        );

  }
}