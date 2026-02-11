import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';

import 'package:car_rental/features/booking/presentation/view/widgets/selected_widget.dart';
import 'package:flutter/material.dart';

import 'package:car_rental/core/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DistanceDetails extends StatelessWidget {

  DistanceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        String textClick = (state is SelectedLocation)?'Change':'Select Location';
        String content = (state is SelectedLocation)?
        '${state.selectedLocation.title} , ${state.selectedLocation.subtitle} ':
        'Any location';
        return SelectedWidget(
          textHeadline: 'Pickup & Return',
          iconData: Icons.location_on,
          textClick: textClick,
          content: content,
          onTap:() {
            Navigator.pushNamed(
              context,
              AppRouter.selectLocationRoute,

            );
          } ,
        );
      },
    );
  }
}
