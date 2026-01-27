import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProcessToPayWidget extends StatelessWidget {
  final double pricePerHour;
  final double originalPrice;

  const ProcessToPayWidget({
    super.key,
    required this.pricePerHour,
    required this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // The main container for the widget, styled to match the image's rounded corners and dark background.
      padding:  EdgeInsets.symmetric(horizontal: AppSize.s20.w, vertical:AppSize.s15.h),
      decoration: BoxDecoration(
        color: ColorManager.grey, // Dark background for the widget itself
        borderRadius: BorderRadius.circular(25.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // subtle shadow
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
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${originalPrice.toStringAsFixed(2)}',
                // Original (crossed-out) price
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16.0,
                  decoration: TextDecoration
                      .lineThrough, // Strikethrough effect
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
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text(
                'Proceed to Pay',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}