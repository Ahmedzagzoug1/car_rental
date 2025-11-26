import 'package:car_rental/features/booking/presentation/view/widgets/build_calendar_grid.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/build_calender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/shared_components/shared_widgets/display_time_and_date.dart' show DisplayTimeAndDate;
import '../../../domain/entities/time_entity.dart';
import '../../cubit/time_cubit/time_cubit.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeCubit, TimeState>(
      builder: (context, state) {
        TimeEntity timeEntity;

        if (state is TimeSelected) {
          timeEntity = state.timeEntity;
        } else {
          final now = DateTime.now();
          timeEntity = TimeEntity(
            pickupDate: DateFormat('yyyy-MM-dd').format(now),
            pickupTime: DateFormat('hh:mm a').format(now),
            returnDate:
            DateFormat('yyyy-MM-dd').format(now.add(const Duration(days: 7))),
            returnTime: DateFormat('hh:mm a')
                .format(now.add(const Duration(hours: 1))),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Select Trip Date & Time'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  final now = DateTime.now();
                  context.read<TimeCubit>().selectTime(
                    TimeEntity(
                      pickupDate:
                      DateFormat('yyyy-MM-dd').format(now),
                      pickupTime:
                      DateFormat('hh:mm a').format(now),
                      returnDate:
                      DateFormat('yyyy-MM-dd').format(now.add(const Duration(days: 7))),
                      returnTime:
                      DateFormat('hh:mm a').format(now.add(const Duration(hours: 1))),
                    ),
                  );
                },
                child: Text(
                  'Reset',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DisplayTimeAndDate(timeEntity: state.timeEntity),
                const SizedBox(height: 20),
                const Divider(thickness: 1),
                const SizedBox(height: 20),
                BuildCalender(timeEntity:  state.timeEntity),
                const SizedBox(height: 20),
                BuildCalendarGrid(timeEntity:  state.timeEntity),
                const SizedBox(height: 30),
                _buildTimeSlider(context, 'Pickup', state.timeEntity.pickupTime, true,timeEntity),
                const SizedBox(height: 20),
                _buildTimeSlider(context, 'Return', state.timeEntity.returnTime, false,timeEntity),
                ElevatedButton(
                  onPressed: () {
                    context.read<TimeCubit>().saveTime(state.timeEntity);
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }




  Widget _buildTimeSlider(
      BuildContext context, String label, String currentTime, bool isPickup, TimeEntity timeEntity) {
    final parsedTime = DateFormat('hh:mm a').parse(currentTime);
    double sliderValue =
        parsedTime.hour.toDouble() + (parsedTime.minute.toDouble() / 60.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label Time'),
        Slider(
          value: sliderValue,
          min: 0.0,
          max: 23.99,
          divisions: 96,
          label: currentTime,
          onChanged: (value) {
            final hour = value.floor();
            final minute = ((value - hour) * 60).round();
            final formatted =
            DateFormat('hh:mm a').format(DateTime(0, 0, 0, hour, minute));
            final cubit = context.read<TimeCubit>();
            final old = (cubit.state is TimeSelected)
                ? (cubit.state as TimeSelected).timeEntity
                : timeEntity;
            cubit.selectTime(TimeEntity(
              pickupTime: isPickup ? formatted : old.pickupTime,
              returnTime: isPickup ? old.returnTime : formatted, pickupDate: old.pickupDate, returnDate: old.returnDate
            ));
          },
        ),
      ],
    );
  }
}
