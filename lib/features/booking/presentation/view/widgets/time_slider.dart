import 'dart:ffi';

import 'package:car_rental/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
class TimeSlider extends StatelessWidget {
  final String label, time;
  final Function(double) onChanged;
  const TimeSlider({required this.label, required this.time, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          SliderTheme(
            data: SliderThemeData(thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10)),
            child: Slider(
              value: parseTimeToDouble(time),
              max: 95,
              divisions: 95,
              activeColor: ColorManager.primary,
              onChanged: onChanged,
            ),
          ),
          Align(alignment: Alignment.centerRight, child: Text(time)),
        ],
      ),
    );
  }
  
}
double parseTimeToDouble(String time) {
  try {
    final dateTime = DateFormat('hh:mm a').parse(time);
    return (dateTime.hour * 4 + dateTime.minute / 15).toDouble();
  } catch (e) {
    return 0.0;
  }
}