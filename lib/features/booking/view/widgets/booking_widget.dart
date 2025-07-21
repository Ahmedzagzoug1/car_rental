import 'package:flutter/material.dart';
class BookingWidget extends StatelessWidget {
  const BookingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // The black background container
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Price display
          const Text(
            '\$26.32/h',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Book Now button
          ElevatedButton(
            onPressed: () {
              // TODO: Implement booking logic here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Book Now tapped!')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreen, // Green button color
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
            ),
            child:  Text(
              'Book Now',
              style:Theme.of(context).textTheme.labelMedium ,
          ),)
        ],
      ),
    );
  }
}