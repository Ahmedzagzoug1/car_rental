import 'package:flutter/material.dart';
class DateColumn extends StatelessWidget {
  final String date, time;
  const DateColumn({required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(date.isEmpty ? 'Select Date' : date, style: Theme.of(context).textTheme.titleLarge),
        Text(time, style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}