import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/features/booking/presentation/cubit/trip_date_cubit/trip_date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
class CustomCalendar extends StatelessWidget {

  const CustomCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripDateCubit, TripDateState>(
      builder: (context, state) {
        return TableCalendar(
          firstDay: DateTime.now(),
          lastDay: DateTime.now().add(const Duration(days: 365)),
          focusedDay: state.rangeStart ?? DateTime.now(),
          rangeStartDay: state.rangeStart,
          rangeEndDay: state.rangeEnd,
          rangeSelectionMode: RangeSelectionMode.enforced,
          onRangeSelected: (start, end, focused) {
            context.read<TripDateCubit>().updateRange(start, end);
          },
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.bold),
          ),
          calendarStyle: CalendarStyle(
            rangeHighlightColor: ColorManager.emeraldGreen05,
            rangeStartDecoration: BoxDecoration(color: ColorManager.primary, shape: BoxShape.circle),
            rangeEndDecoration: BoxDecoration(color: ColorManager.primary, shape: BoxShape.circle),
            todayDecoration: BoxDecoration(color: ColorManager.grey, shape: BoxShape.circle),
          ),
        );
      },
    );
  }
}