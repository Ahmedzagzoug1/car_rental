import 'package:car_rental/features/booking/data/model/time_model.dart';
import 'package:flutter/material.dart';
class DisplayTimeAndDate extends StatelessWidget {
  final TimeModel timeModel;
  const DisplayTimeAndDate({super.key, required this.timeModel});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
  Widget _buildTopDateTimeDisplay() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildDateTimeColumn(timeModel.pickupDate, timeModel.pickupTime),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(Icons.arrow_forward, color: Colors.grey.shade600),
        ),
        _buildDateTimeColumn(timeModel.returnDate, timeModel.returnTime),
      ],
    );
  }

  Widget _buildDateTimeColumn(String date, String time) {
    return Column(
      children: [
        Text(
          date,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade700,
          ),
        ),
        Center(
          child: Text(
            time,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
