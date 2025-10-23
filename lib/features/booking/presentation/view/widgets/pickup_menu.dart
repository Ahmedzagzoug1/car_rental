import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
class PickupMenu extends StatefulWidget {
  @override
  State<PickupMenu> createState() => _PickupLocationsScreenState();
}

class _PickupLocationsScreenState extends State<PickupMenu> {
  int selectedIndex = 3;

  final List<PickupLocation> locations = [
    PickupLocation(title: 'Pickup at Car Location', subtitle: "We’ll send you the exact location once your trip is booked", price: 'Free'),
    PickupLocation(title: 'Miami International Airport', subtitle: "Airport", price: '\$120'),
    PickupLocation(title: 'Ford International Airport', subtitle: "Airport", price: '\$120'),
    PickupLocation(title: 'Cruiseport Destinations', subtitle: "1001 North America Way, Miami, FL 33132", price: '\$120'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 316.h,
          child: ListView.builder(
              itemCount: locations.length,

              itemBuilder: (context,index){

              final loc = locations[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: RadioListTile(
                  value: index,
                  groupValue: selectedIndex,
                  onChanged: (value) {
                    setState(() {
                      selectedIndex = value!;
                    });
                  },
                  title: Text(loc.title, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(loc.subtitle),
                  secondary: Text(loc.price, style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              );

            }),
          ),


    );
  }
}