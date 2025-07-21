import 'package:car_rental/features/booking/model/time_model.dart';
import 'package:flutter/material.dart';
class DateAndTimeDetails extends StatelessWidget {
final TimeModel? timeModel;
  const DateAndTimeDetails({super.key, this.timeModel});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trip Dates',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.green),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '${timeModel!.pickupDate } to ${timeModel!.returnDate }'??'any time',
                      style: Theme.of(context).textTheme.displayMedium
                    ),
                  ),
                  Text(
                    (timeModel ==null)?      'Add Dates':'change',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.green),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
