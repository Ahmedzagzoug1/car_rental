import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
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

        String title = 'Add Location';  // default
        List<PickupLocationEntity> pickupLocations = [];

        if (state is SelectedLocation) {
          title = state.selectedLocation.title;
        }

        if (state is LocationsLoaded) {
          pickupLocations = state.pickupLocations;



          return SelectedWidget(
            textHeadline: 'Pickup & Return',
            iconData: Icons.location_on,
            toggleText: title,
            onTap: () {
               Navigator.pushNamed(
                 context,
                 AppRouter.selectLocationRoute,
                 arguments: {'pickupLocations': pickupLocations},
               );

            },
            content: 'Change',
          );
        }

        return SelectedWidget(
          textHeadline: 'Pickup & Return',
          iconData: Icons.location_on,
          toggleText: title,
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouter.selectLocationRoute,
              arguments: {'pickupLocations': pickupLocations},
            );
          },
          content: 'Add location',
        );
      },
    );




    /* return BlocBuilder<LocationCubit, LocationState>(

      builder: (context, state) {
        late PickupLocationEntity selectedLocation;
       if(context.read<LocationCubit>().state is SelectedLocation) {
         selectedLocation = (context
             .read<LocationCubit>()
             .state as SelectedLocation).selectedLocation;
       }
        if(state is LocationsLoaded) {
          title = 'selectedLocation.title';
          pickupLocations = state.pickupLocations;

          return SelectedWidget(textHeadline: 'Pickup & Return',
              iconData: Icons.location_on,
              toggleText: title ,
              onTap: () {
                Navigator.pushNamed(context, AppRouter.selectLocationRoute,
                    arguments: {'pickupLocations': pickupLocations});
              },
              content:   'Change');
        }else{
          return SelectedWidget(textHeadline: 'Pickup & Return',
              iconData: Icons.location_on,
              toggleText:  'Add Location',
              onTap: () {
                Navigator.pushNamed(context, AppRouter.selectLocationRoute,
                    arguments: {'pickupLocations': pickupLocations});
              },
              content:  'Add location');
        }
        },

    );*/
  }
}
