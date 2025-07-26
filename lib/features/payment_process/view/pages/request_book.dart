import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/shared_widgets/bottom_widget.dart';
import 'package:car_rental/core/shared_widgets/display_time_and_date.dart';
import 'package:car_rental/features/booking/model/host_model.dart';
import 'package:car_rental/features/booking/model/time_model.dart';
import 'package:car_rental/features/payment_process/view/widgets/car_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../booking/model/car_model.dart';
import '../widgets/payment_detail_row.dart';
class RequestBook extends StatefulWidget {
  final CarModel carModel;
  final HostModel hostModel; // Included based on your previous snippet

  const RequestBook({
    super.key,
    required this.carModel,
    required this.hostModel,
  });

  @override
  State<RequestBook> createState() => _RequestBookState();
}

class _RequestBookState extends State<RequestBook> {
  // Initial date and time values
  DateTime _startDate = DateTime.now().add(const Duration(days: 1));
  DateTime _endDate = DateTime.now().add(const Duration(days: 8));
  TimeOfDay _startTime = const TimeOfDay(hour: 5, minute: 0); // 5:00 AM
  TimeOfDay _endTime = const TimeOfDay(hour: 22, minute: 0); // 10:00 PM

  // Function to calculate trip duration in days
  int _calculateTripDays() {
    final start = DateTime(_startDate.year, _startDate.month, _startDate.day);
    final end = DateTime(_endDate.year, _endDate.month, _endDate.day);
    return end.difference(start).inDays;
  }

  // Date picker function
  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart ? _startDate : _endDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2028),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          // Ensure end date is not before start date
          if (_endDate.isBefore(_startDate)) {
            _endDate = _startDate.add(const Duration(days: 1));
          }
        } else {
          _endDate = picked;
          // Ensure start date is not after end date
          if (_startDate.isAfter(_endDate)) {
            _startDate = _endDate.subtract(const Duration(days: 1));
          }
        }
      });
    }
  }

  // Time picker function
  Future<void> _selectTime(BuildContext context, bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStart ? _startTime : _endTime,
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final int tripDays = _calculateTripDays();
    final double basePrice = widget.carModel.price * 24 * tripDays; // Assuming 24 hours/day
    const double tripFee = 3.87;
    const double discount = 0.0; // Placeholder for discount
    final double totalAmount = basePrice + tripFee - discount;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Request Book',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorManager.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car Information Section
       CarInformationWidget(carModel:widget. carModel),
            const SizedBox(height: 24),

            // Trip Date & Time Section
            const Text(
              'Trip Date & Time',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: DisplayTimeAndDate(timeModel: TimeModel.specificTimeObject,)
            ),
            const SizedBox(height: 24),

            // Pickup & Return Section
            const Text(
              'Pickup & Return',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.green[700]),
                const SizedBox(width: 8),
                const Text(
                  'Los Angeles, CA 91602',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Payment Details Section
            const Text(
              'Payment Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Column(
              children: [
                PaymentDetailRow(
               label:    '\$${widget.carModel.price.toStringAsFixed(2)} x ${tripDays} days',
            value:       '\$${basePrice.toStringAsFixed(2)}',
                ),
                PaymentDetailRow(label:  'Trip fee',value:  '\$${tripFee.toStringAsFixed(2)}'),
                PaymentDetailRow(label: 'Discount',value:  '-', isDiscount: true),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                PaymentDetailRow(
                 label:  'Total Amount',
               value:    '\$${totalAmount.toStringAsFixed(2)}',
                  isTotal: true,
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Request to Book Button
         /*   SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle request to book logic
                  print('Request to Book pressed!');
                  print('Start Date: $_startDate');
                  print('End Date: $_endDate');
                  print('Start Time: ${_startTime.format(context)}');
                  print('End Time: ${_endTime.format(context)}');
                  print('Total Amount: \$${totalAmount.toStringAsFixed(2)}');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700], // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  shadowColor: Colors.green.withOpacity(0.3),
                ),
                child: const Text(
                  'Request to Book',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),*/
            BottomWidget(price: '300', subtitle: 'Total Amount', btn_text: 'Proceed to Pay')
          ],
        ),
      ),
    );
  }

}
