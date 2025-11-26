import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BuildCalendarGrid extends StatefulWidget {
  final TimeEntity timeEntity;

  const BuildCalendarGrid({super.key, required this.timeEntity});

  @override
  State<BuildCalendarGrid> createState() => _BuildCalendarGridState();
}

class _BuildCalendarGridState extends State<BuildCalendarGrid> {
  late DateTime _focusedDay;
  late DateTime firstDayOfMonth;
  late int daysInMonth;
  late int firstWeekday;
  late int initialPadding;
  final List<String> weekDays = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sat'];

  @override
  void initState() {
initDate();
    super.initState();
  }
  initDate(){
    _focusedDay=DateTime.now();
    firstDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);
    daysInMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 0).day;
    firstWeekday = firstDayOfMonth.weekday; // 1 for Monday, 7 for Sunday

    initialPadding = firstWeekday % 7; // Monday->1, Sunday->0

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Weekday headers
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weekDays.map((day) =>
              Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
          ).toList(),
        ),
        RSizedBox(height: 10),
        // Days grid
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(), // Disable scrolling for grid
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1.0,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemCount: initialPadding + daysInMonth, // Total cells to display
          itemBuilder: (context, index) {
            if (index < initialPadding) {
              return Container(); // Empty cells before the 1st day
            }

            final int dayNumber = index - initialPadding + 1;
            final DateTime? currentDay = DateTime(_focusedDay.year, _focusedDay.month, dayNumber);
DateTime? pickupDate=DateTime.parse( widget.timeEntity.pickupDate);
DateTime? returnDate=DateTime.parse( widget.timeEntity.returnDate);
            bool isPickupSelected =
            pickupDate!= null &&
                currentDay !=null &&
                currentDay.year ==pickupDate.year &&
                currentDay.month == pickupDate.month &&
                currentDay.day ==pickupDate.day;

            bool isReturnSelected =
                returnDate!= null &&
                    currentDay !=null &&
                currentDay.year == returnDate.year &&
                currentDay.month == returnDate.month &&
                currentDay.day ==returnDate.day;

            bool isInRange =currentDay!=null&&
                currentDay.isAfter(pickupDate) && currentDay.isBefore(returnDate);

            Color backgroundColor = ColorManager.white;
            Color textColor = ColorManager.black;
            FontWeight fontWeight = FontWeight.normal;

            if (isPickupSelected || isReturnSelected) {
              backgroundColor = ColorManager.green2;
              textColor = ColorManager.white;
              fontWeight = FontWeight.bold;
            } else if (isInRange) {
              backgroundColor = ColorManager.green2; // Light green for range
            } else {
              backgroundColor = ColorManager.grey;
              textColor = Colors.black87;
            }

            return GestureDetector(
              onTap: () {
                setState(() {
                  if (pickupDate == null || returnDate != null) {
                    // Start a new selection or reset if return was already selected
                    pickupDate =currentDay;
                    returnDate = null;
                  } else if (currentDay !=null&&pickupDate !=null&&  currentDay.isAfter(pickupDate!)) {
                    // Select return date if it's after pickup
                    returnDate = currentDay;
                  } else {
                    // If selected day is before or same as pickup, make it the new pickup
                    pickupDate = currentDay;
                    returnDate = null; // Reset return
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$dayNumber',
                  style:Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            );
          },
        ),
      ],
    );  }
}
