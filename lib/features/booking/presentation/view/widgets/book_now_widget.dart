import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/core/shared_components/shared_widgets/bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BookNowWidget extends StatelessWidget {
  final double pricePerHour;
  final double originalPrice;

  const BookNowWidget({
    super.key,
    required this.pricePerHour,
    required this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: AppSize.s20.w, vertical: AppSize.s12.h),
      decoration: BoxDecoration(
        color: Colors.grey[900], // Dark background for the widget itself
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s16.r),topRight: Radius.circular(AppSize.s16.r)), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: AppSize.s2.r,
            blurRadius: AppSize.s7.r,
            offset:  Offset(AppSize.s0, AppSize.s3.h), // subtle shadow
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Wrap content horizontally
        children: <Widget>[
          // Left section: Price display
          Column(
            mainAxisSize: MainAxisSize.min, // Wrap content vertically
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '\$${pricePerHour.toStringAsFixed(2)}/h', // Current price
                 style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                '\$${originalPrice.toStringAsFixed(2)}', // Original (crossed-out) price
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16.0,
                  decoration: TextDecoration.lineThrough, // Strikethrough effect
                ),
              ),
            ],
          ),
          const RSizedBox(width: 30.0), // Space between price and button

          // Right section: Book Now button
          Expanded( // Allows the button to take available horizontal space
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Book Now button pressed!')),
                );
                Navigator.pushNamed(context, AppRouter.paymentProcessRoute);
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child:  Text(
                'Book Now',
                style:    Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }}