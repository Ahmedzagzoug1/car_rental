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
    Color backgroundColor = Colors.transparent;
    Color textColor = Colors.black;
    BoxBorder? border;
    BoxShape shape = BoxShape.rectangle;
    return Container(
      color: ColorManager.white,
      child: Column(
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
          const RSizedBox(height: 10),
          // Days grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling for grid
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
              final DateTime currentDay = DateTime(_focusedDay.year, _focusedDay.month, dayNumber);
      DateTime? pickupDate=DateTime.parse( widget.timeEntity.pickupDate);
      DateTime? returnDate=DateTime.parse( widget.timeEntity.returnDate);
              bool isPickupSelected = pickupDate != null &&
                  currentDay.year == pickupDate!.year &&
                  currentDay.month == pickupDate!.month &&
                  currentDay.day == pickupDate!.day;

              bool isReturnSelected = returnDate != null &&
                  currentDay.year == returnDate!.year &&
                  currentDay.month == returnDate!.month &&
                  currentDay.day == returnDate!.day;

              bool isInRange = pickupDate != null &&
                  returnDate != null &&
                  currentDay.isAfter(pickupDate!) &&
                  currentDay.isBefore(returnDate!);

              Color backgroundColor = ColorManager.white;
              Color textColor = ColorManager.black;
// بداية أو نهاية الرينج
              if (isPickupSelected || isReturnSelected) {
                backgroundColor = Colors.transparent;
                textColor = ColorManager.green;
                border = Border.all(
                  color: ColorManager.green,
                  width: 2,
                );
                shape = BoxShape.circle;
              }

// داخل الرينج
              else if (isInRange) {
                backgroundColor = ColorManager.green.withOpacity(0.2);
                textColor = Colors.black;
              }

// يوم عادي
              else {
                backgroundColor = Colors.transparent;
                textColor = Colors.black;
              }

              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (pickupDate == null || returnDate != null) {
                      // Start a new selection or reset if return was already selected
                      pickupDate =currentDay;
                      returnDate = null;
                    } else if (pickupDate !=null&&  currentDay.isAfter(pickupDate!)) {
                      // Select return date if it's after pickup
                      returnDate = currentDay;
                    } else {
                      // If selected day is before or same as pickup, make it the new pickup
                      pickupDate = currentDay;
                      returnDate = null; // Reset return
                    }
                  });
                },
                child:Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: shape,
                    border: border,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$dayNumber',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: textColor),
                  ),
                )
              );
            },
          ),
        ],
      ),
    );  }
}
