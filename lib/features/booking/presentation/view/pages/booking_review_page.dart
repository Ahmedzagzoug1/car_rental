import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/core/shared_components/shared_widgets/bottom_widget.dart';
import 'package:car_rental/core/shared_components/shared_widgets/display_time_and_date.dart';
import 'package:car_rental/features/booking/presentation/cubit/booking_cubit/booking_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/time_cubit/time_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/car_review_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/payment_detail_row.dart';
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
          'Request to Book',
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
Navigator.pop(context);
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
                      color: ColorManager.emeraldGreen05,
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
                  locationEntity?.title ?? 'No Location Founded',
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
            const RSizedBox(height: 12), Container(
              color: ColorManager.charcoalBlack05,
              child:
              Padding(padding: EdgeInsets.all(16),
                child: Column(

                children: [
                  PaymentDetailRow(
                    label: '\$${carEntity?. pricePerHour.toStringAsFixed(2)} x ${carEntity
                        ?.trips} days',
                    value: '\$${carEntity?.pricePerHour.toStringAsFixed(2)}',
                  ),
                  PaymentDetailRow(label: 'Trip fee',
                      value: '\$${carEntity?.pricePerHour.toStringAsFixed(2)}'),
                   PaymentDetailRow(
                      label: 'Discount', value: '-'),
                  const RPadding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(),
                  ),
                  PaymentDetailRow(
                    label: 'Total Amount',
                    labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorManager.black),
                    valueStyle: Theme.of(context).textTheme.headlineLarge,
                    value: '\$${carEntity?.pricePerHour.toStringAsFixed(2)}',

                  ),
                ],
              ),
            ),),
            const RSizedBox(height: 8),

            BottomWidget(price: '300',
                subtitle: 'Total Amount',
                onPressed: (){
              Navigator.pushNamed(context, AppRouter.approvedPage);
                },
                btnText: 'Proceed to Pay')
          ],
        ),
      );
    } else {
return const CircularProgressIndicator();
    }
  }),
    );
  }

}
