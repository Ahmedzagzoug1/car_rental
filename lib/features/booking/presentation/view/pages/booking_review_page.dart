import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/shared_components/shared_widgets/bottom_widget.dart';
import 'package:car_rental/core/shared_components/shared_widgets/display_time_and_date.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/domain/entities/host_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/booking_cubit/booking_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/booking_cubit/booking_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/time_cubit/time_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/car_information_widget.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/car_review_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
   class BookingReviewPage extends StatefulWidget {


  const BookingReviewPage({
    super.key,
  });

  @override
  State<BookingReviewPage> createState() => _RequestBookState();
}

class _RequestBookState extends State<BookingReviewPage> {
  // Initial date and time values
 /* DateTime _startDate = DateTime.now().add(const Duration(days: 1));
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
*/
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Request Book',
          style: TextStyle(
            color: ColorManager.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorManager.white,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios, color: ColorManager.black),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
          },
        ),
      ),
      body: BlocBuilder<BookingCubit, BookingState>(
  builder: (context, state) {
    if (state is BookingUpdated) {
      final timeEntity = context
          .read<BookingCubit>()
          .selectedTime;
      final carEntity = context
          .read<BookingCubit>()
          .selectedCar;
      final locationEntity = context
          .read<BookingCubit>()
          .selectedLocation;
      return SingleChildScrollView(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CarReviewWidget(),
            const RSizedBox(height: 24),

            const Text(
              'Trip Date & Time',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const RSizedBox(height: 12),
            BlocBuilder<TimeCubit, TimeState>(
              builder: (context, state) {
                return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12
                        .h),
                    decoration: BoxDecoration(
                      color: ColorManager.grey,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: DisplayTimeAndDate(timeEntity: timeEntity!,)

                );
              },
            ),
            const RSizedBox(height: 24),

            // Pickup & Return Section
            const Text(
              'Pickup & Return',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const RSizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.location_on, color: ColorManager.green),
                const RSizedBox(width: 8),
                Text(
                  '${locationEntity?.title ?? 'No Location Founded'}',
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorManager.black,
                  ),
                ),
              ],
            ),
            const RSizedBox(height: 24),

            // Payment Details Section
            const Text(
              'Payment Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const RSizedBox(height: 12),
            Column(
              children: [
                PaymentDetailRow(
                  label: '\$${carEntity?.price.toStringAsFixed(2)} x ${carEntity
                      ?.trips} days',
                  value: '\$${carEntity?.price.toStringAsFixed(2)}',
                ),
                PaymentDetailRow(label: 'Trip fee',
                    value: '\$${carEntity?.price.toStringAsFixed(2)}'),
                PaymentDetailRow(
                    label: 'Discount', value: '-', isDiscount: true),
                const RPadding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                PaymentDetailRow(
                  label: 'Total Amount',
                  value: '\$${carEntity?.price.toStringAsFixed(2)}',
                  isTotal: true,
                ),
              ],
            ),
            const RSizedBox(height: 32),

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
            BottomWidget(price: '300',
                subtitle: 'Total Amount',
                btn_text: 'Proceed to Pay')
          ],
        ),
      );
    } else {
return CircularProgressIndicator();
    }
  }),
    );
  }

}
