import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/resources/color_manager.dart';
class BuildCalender extends StatefulWidget {
  final TimeEntity timeEntity;
  const BuildCalender({super.key, required this.timeEntity});

  @override
  State<BuildCalender> createState() => _BuildCalenderState();
}

class _BuildCalenderState extends State<BuildCalender> {
  @override
  Widget build(BuildContext context) {
    DateTime _focusedDay = DateTime.now(); // Current month for calendar view

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.chevron_left, color: ColorManager.grey),
          onPressed: () {
            setState(() {
              _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
            });
          },
        ),
        Text(
          DateFormat('MMMM yyyy').format(_focusedDay).toUpperCase(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorManager.green,
          ),
        ),
        IconButton(
          icon: Icon(Icons.chevron_right, color: ColorManager.grey),
          onPressed: () {
            setState(() {
              _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
            });
          },
        ),
      ],
    );  }
}
