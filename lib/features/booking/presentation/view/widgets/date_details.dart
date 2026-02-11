import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/time_cubit/time_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/trip_date_cubit/trip_date_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/trip_date_cubit/trip_date_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/selected_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DateDetails extends StatelessWidget {

  const DateDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripDateCubit, TripDateState>(
      builder: (context, state) {
        TimeEntity timeEntity= state.timeEntity;
        return SelectedWidget(
          textHeadline: 'Trips Date',
          iconData: Icons.calendar_today,
          content: (state is TimeInitial)
              ? 'Any time'
              : '${timeEntity.pickupDate} to ${timeEntity.returnDate}',
          textClick: (state is TimeInitial) ? 'Add Dates' : 'Change',
          onTap: ()  {
        Navigator.pushNamed(
              context,
              AppRouter.selectTimeRoute,
            );
            }

        );
      },
    );
  }
}
