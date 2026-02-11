import 'package:car_rental/features/booking/presentation/cubit/trip_date_cubit/trip_date_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/time_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class TimeSelectorSection extends StatelessWidget {
  const TimeSelectorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripDateCubit, TripDateState>(
      builder: (context, state) {
        return Column(
          children: [
            TimeSlider(
              label: "Pickup",
              time: state.timeEntity.pickupTime,
              onChanged: (v) => context.read<TripDateCubit>().updatePickupTime(v),
            ),
            TimeSlider(
              label: "Return",
              time: state.timeEntity.returnTime,
              onChanged: (v) => context.read<TripDateCubit>().updateReturnTime(v),
            ),
          ],
        );
      },
    );
  }
}
