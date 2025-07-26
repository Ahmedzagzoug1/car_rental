import 'package:car_rental/features/booking/model/pickup_location.dart';
import 'package:car_rental/features/booking/view/widgets/selected_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/app_router.dart';
class DistanceDetails extends StatelessWidget {
  PickupLocation? pickupLocation;
   DistanceDetails({super.key,this.pickupLocation});

  @override
  Widget build(BuildContext context) {
    return SelectedWidget(textHeadline: 'Pickup & Return',
    iconData: Icons.location_on,
        toggleText: (pickupLocation==null)?'Add Location' :'${pickupLocation!.title}',
    onTap: (){
    Navigator.pushNamed(context, AppRouter.selectLocationRoute);
    },
    content: (pickupLocation==null) ?'location':'change');
  }
}
