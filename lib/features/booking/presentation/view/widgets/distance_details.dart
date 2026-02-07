import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';

import 'package:car_rental/features/booking/presentation/view/widgets/selected_widget.dart';
import 'package:flutter/material.dart';

import 'package:car_rental/core/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DistanceDetails extends StatelessWidget {
  late List<PickupLocationEntity> pickupLocations;
  late String title;

  DistanceDetails({super.key,required this.pickupLocations});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        String title = 'Location';
        List<PickupLocationEntity> pickupLocations = [];
        bool isLoading = true;

        if (state is LocationsLoaded) {
          pickupLocations = state.pickupLocations;
          isLoading = false;
        }

        if (state is SelectedLocation) {
          title = state.selectedLocation.title;
        }

        return SelectedWidget(
          textHeadline: 'Pickup & Return',
          iconData: Icons.location_on,
          textClick: title,
          content: isLoading ? 'Loading...' : 'Change',
          onTap: isLoading
              ? null
              : () {
            Navigator.pushNamed(
              context,
              AppRouter.selectLocationRoute,
              arguments: {
                'pickupLocations': pickupLocations,
              },
            );
          },
        );
      },
    );
  }
}
