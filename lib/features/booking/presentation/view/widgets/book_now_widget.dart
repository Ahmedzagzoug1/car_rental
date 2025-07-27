import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/core/shared_widgets/bottom_widget.dart';
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
      // The main container for the widget, styled to match the image's rounded corners and dark background.
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.grey[900], // Dark background for the widget itself
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)), // Rounded corners
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
                '\$${originalPrice.toStringAsFixed(2)}', // Original (crossed-out) price
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16.0,
                  decoration: TextDecoration.lineThrough, // Strikethrough effect
                ),
              ),
            ],
          ),
          const SizedBox(width: 30.0), // Space between price and button

          // Right section: Book Now button
          Expanded( // Allows the button to take available horizontal space
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Book Now button pressed!')),
                );
                Navigator.pushNamed(context, AppRouter.paymentProcessRoute);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent[700], // Green button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0), // Rounded button corners
                ),
                padding: const EdgeInsets.symmetric(vertical: 15.0), // Button padding
                elevation: 5, // Button shadow
              ),
              child: const Text(
                'Book Now',
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
  }}