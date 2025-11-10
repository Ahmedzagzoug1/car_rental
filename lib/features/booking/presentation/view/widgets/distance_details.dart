import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/selected_widget.dart';
import 'package:flutter/material.dart';

import 'package:car_rental/core/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DistanceDetails extends StatelessWidget {
  PickupLocationEntity? pickupLocation;

  DistanceDetails({super.key, this.pickupLocation});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(

      builder: (context, state) {
        return SelectedWidget(textHeadline: 'Pickup & Return',
            iconData: Icons.location_on,
            toggleText: (pickupLocation == null)
                ? 'Add Location'
                : '${pickupLocation!.title}',
            onTap: () {
              Navigator.pushNamed(context, AppRouter.selectLocationRoute);
            },
            content: (pickupLocation == null) ? 'location' : 'change');
      },
    );
  }
}
