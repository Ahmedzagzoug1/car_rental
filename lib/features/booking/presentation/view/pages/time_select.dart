import 'package:car_rental/core/shared_components/shared_widgets/display_time_and_date.dart';
import 'package:car_rental/features/booking/data/model/time_model.dart';
import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/time_cubit/time_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/routes/app_router.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  DateTime? _pickupDate;
  TimeOfDay? _pickupTime;
  DateTime? _returnDate;
  TimeOfDay? _returnTime;
  DateTime _focusedDay = DateTime.now(); // Current month for calendar view
  TimeEntity?  _selectedTimeEntity ; // Currently selected day in calendar

  @override
  void initState() {
  super.initState();
  // Initialize with some sensible defaults
  _pickupDate = DateTime.now();
  _pickupTime = TimeOfDay.now();
  _returnDate = DateTime.now().add(Duration(days: 7));
  _returnTime = TimeOfDay.fromDateTime(DateTime.now().add(Duration(hours: 1)));
  final formattedDate = DateFormat('yyyy-MM-dd').format(_pickupDate!);
  _selectedTimeEntity=TimeEntity(pickupDate:formatDate(_pickupDate),
      pickupTime:formatTimeOfDay(_pickupTime!),
      returnDate: formatDate(_returnDate), returnTime: formatTimeOfDay(_returnTime!));

  }

  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
    appBar: AppBar(
      title: Text('Select Trip Date & Time'),
        leading: InkWell(child:  Icon(Icons.arrow_back_ios),
            onTap: (){Navigator.pop(context);}),
      actions: [
          InkWell(onTap: (){
            _pickupDate = DateTime.now();
            _pickupTime = TimeOfDay.now();
            _returnDate = DateTime.now().add(Duration(days: 7));
            _returnTime = TimeOfDay.fromDateTime(DateTime.now().add(Duration(hours: 1)));
setState(() {

});
          },
            child: Text('Reset',style: Theme.of(context).textTheme.displayMedium,), )
        ],
      backgroundColor: ColorManager.white,
      elevation: 0,


    ),
    body: SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    // Top Date and Time Display
    DisplayTimeAndDate(
        timeEntity: getSelectedTimeEntity()),
    SizedBox(height: 20.h),
    Divider(color: ColorManager.Gray, thickness: 1),
    SizedBox(height: 20.h),

    // Calendar Month Navigation
    _buildMonthNavigation(),
    SizedBox(height: 10.h),

    // Calendar Grid
    _buildCalendarGrid(), // Replace with TableCalendar if using the package
    SizedBox(height: 30),

    // Pickup Time Slider
    _buildTimePickerSlider(
    "Pickup",
    _pickupTime,
    (newTime) {
    setState(() {
    _pickupTime = newTime;
    });
    },
    ),
    SizedBox(height: 20.h),

    // Return Time Slider
    _buildTimePickerSlider(
    "Return",
    _returnTime,
    (newTime) {
    setState(() {
    _returnTime = newTime;
    });
    },
    ),
      ElevatedButton(onPressed: (){
BlocProvider.of<TimeCubit>(context).saveTime(_selectedTimeEntity!);
Navigator.pop(context);
      },
      style: Theme.of(context).elevatedButtonTheme.style,
          child: Text('Save'))
    ],
    ),
    ),
    ),
  );
  }


  Widget _buildMonthNavigation() {
  return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  IconButton(
  icon: Icon(Icons.chevron_left, color: Colors.grey.shade700),
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
  color: Colors.green.shade700,
  ),
  ),
  IconButton(
  icon: Icon(Icons.chevron_right, color: Colors.grey.shade700),
  onPressed: () {
  setState(() {
  _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
  });
  },
  ),
  ],
  );
  }

  Widget _buildCalendarGrid() {
  // This is a simplified custom calendar grid.
  // For a production app, strongly consider using 'table_calendar' package.

  final DateTime firstDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);
  final int daysInMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 0).day;
  final int firstWeekday = firstDayOfMonth.weekday; // 1 for Monday, 7 for Sunday

  final int initialPadding = firstWeekday % 7; // Monday->1, Sunday->0

  List<String> weekDays = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sat'];

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
  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade600),
  ),
  ),
  ),
  ).toList(),
  ),
  SizedBox(height: 10),
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
  final DateTime currentDay = DateTime(_focusedDay.year, _focusedDay.month, dayNumber);

  bool isPickupSelected = _pickupDate != null &&
  currentDay.year == _pickupDate!.year &&
  currentDay.month == _pickupDate!.month &&
  currentDay.day == _pickupDate!.day;

  bool isReturnSelected = _returnDate != null &&
  currentDay.year == _returnDate!.year &&
  currentDay.month == _returnDate!.month &&
  currentDay.day == _returnDate!.day;

  bool isInRange = _pickupDate != null && _returnDate != null &&
  currentDay.isAfter(_pickupDate!) && currentDay.isBefore(_returnDate!);

  Color backgroundColor = Colors.transparent;
  Color textColor = Colors.black87;
  FontWeight fontWeight = FontWeight.normal;

  if (isPickupSelected || isReturnSelected) {
  backgroundColor = Colors.green.shade600;
  textColor = Colors.white;
  fontWeight = FontWeight.bold;
  } else if (isInRange) {
  backgroundColor = Colors.green.shade100; // Light green for range
  } else {
  backgroundColor = Colors.grey.shade100;
  textColor = Colors.black87;
  }

  return GestureDetector(
  onTap: () {
  setState(() {
  if (_pickupDate == null || _returnDate != null) {
  // Start a new selection or reset if return was already selected
  _pickupDate = currentDay;
  _returnDate = null;
  } else if (currentDay.isAfter(_pickupDate!)) {
  // Select return date if it's after pickup
  _returnDate = currentDay;
  } else {
  // If selected day is before or same as pickup, make it the new pickup
  _pickupDate = currentDay;
  _returnDate = null; // Reset return
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
  style: TextStyle(
  color: textColor,
  fontWeight: fontWeight,
  ),
  ),
  ),
  );
  },
  ),
  ],
  );
  }

  Widget _buildTimePickerSlider(String label, TimeOfDay? currentTime, ValueChanged<TimeOfDay> onChanged) {
  // Convert TimeOfDay to a double for the slider (hours + fraction of hour)
  double sliderValue = currentTime != null
  ? currentTime.hour.toDouble() + (currentTime.minute.toDouble() / 60.0)
      : 12.0; // Default to noon if not set

  return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Padding(
  padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
  child: Text(
  '$label Time',
  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
  ),
  ),
  SliderTheme(
  data: SliderTheme.of(context).copyWith(
  activeTrackColor: Colors.green,
  inactiveTrackColor: Colors.green.shade100,
  thumbColor: Colors.white,
  overlayColor: Colors.green.withOpacity(0.2),
  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
  overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
  valueIndicatorColor: Colors.green, // Background color of the value indicator
  valueIndicatorTextStyle: TextStyle(
  color: Colors.white,
  fontSize: 14.0,
  ),
  ),
  child: Slider(
  value: sliderValue,
  min: 0.0, // 00:00 AM
  max: 23.99, // Represents almost 24:00 (11:59 PM)
  divisions: 24 * 4, // 96 divisions for 15-minute intervals
  label: currentTime?.format(context) ?? 'N/A',
  onChanged: (double value) {
  int hour = value.floor();
  int minute = ((value - hour) * 60).round();
  onChanged(TimeOfDay(hour: hour, minute: minute));
  },
  ),
  ),
  ],
  );
  }
  String formatTimeOfDay(TimeOfDay? time) {
if(time ==null){
  return '12:00';
}
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('hh:mm a').format(dt);
  }

 String formatDate(DateTime? date) {

   if (date ==null) {
     return 'Please Select Date';
   }
    else {
   return  DateFormat('yyyy-MM-dd').format(date);
   }
  }

   getSelectedTimeEntity() {
     setState(() {

     });
    return TimeEntity(pickupDate:formatDate(_pickupDate),
    pickupTime:formatTimeOfDay(_pickupTime!),
    returnDate: formatDate(_returnDate), returnTime: formatTimeOfDay(_returnTime!));

  }

}
