import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/features/booking/data/model/time_model.dart';
import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/time_cubit/time_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/time_cubit/time_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/selected_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DateDetails extends StatelessWidget {

  const DateDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeCubit, TimeState>(
      builder: (context, state) {
        if(state is TimeSuccess) {
          final TimeEntity   timeEntity = state.timeEntity;
          final pickupDate = DateTime.parse(timeEntity.pickupDate);
          final returnDate = DateTime.parse(timeEntity.returnDate);
          return SelectedWidget(textHeadline: 'Trips Date',
            iconData: Icons.calendar_today,
            toggleText: (timeEntity == null) ? 'Add Dates' : 'change',
            onTap: () {
              Navigator.pushNamed(context, AppRouter.selectTimeRoute).then((_){
                context.read<TimeCubit>().getTime();
              });
            },
            content: (timeEntity == null) ? 'Any time' : '${DateFormat('dd MMM').format(pickupDate)} to '
                '${DateFormat('dd MMM').format(returnDate)}',);
        }else{
          return SelectedWidget(textHeadline: 'Trips Date',
            iconData: Icons.calendar_today,
            toggleText:  'Add Dates' ,
            onTap: () {
              Navigator.pushNamed(context, AppRouter.selectTimeRoute).then((_) {
                context.read<TimeCubit>().getTime();
              });
            },
            content: 'Any time',);
        }
      },
    );
  }
}
