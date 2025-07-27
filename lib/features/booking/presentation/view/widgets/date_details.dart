import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/features/booking/data/model/time_model.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/selected_widget.dart';
import 'package:flutter/material.dart';
class DateDetails extends StatelessWidget {
final TimeModel? timeModel;
  const DateDetails({super.key, this.timeModel});

  @override
  Widget build(BuildContext context) {
   return SelectedWidget(textHeadline: 'Trips Date',
       iconData: Icons.calendar_today,
       toggleText: (timeModel==null)? 'Add Dates':'change',
     onTap: (){
     Navigator.pushNamed(context, AppRouter.selectTimeRoute);
     },
     content: (timeModel==null) ?'Any time':'${timeModel!.pickupDate} to '
         '${timeModel!.returnDate}',);
  }
}
