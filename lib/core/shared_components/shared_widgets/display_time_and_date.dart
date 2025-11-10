import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/features/booking/data/model/time_model.dart';
import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DisplayTimeAndDate extends StatelessWidget {
  final TimeEntity timeEntity;
  const DisplayTimeAndDate({super.key, required this.timeEntity});

  @override
  Widget build(BuildContext context) {
    if (timeEntity == null) {
      return Center(
        child: Text('there are an expected error !!!!!!!!!!!!!!!!!'),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildDateTimeColumn(
              timeEntity.pickupDate, timeEntity.pickupTime, context),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.r),
            child: Icon(Icons.arrow_forward, color: ColorManager.grey),
          ),
          _buildDateTimeColumn(
              timeEntity.returnDate, timeEntity.returnTime, context),
        ],
      );
    }
  }
  Widget _buildDateTimeColumn(String date, String time,context) {

    return Column(
      children: [
        Text(
          date,
          style:Theme.of(context).textTheme.bodyMedium,
        ),
        Center(
          child: Text(
            time,
            style:Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ],
    );
  }
}
