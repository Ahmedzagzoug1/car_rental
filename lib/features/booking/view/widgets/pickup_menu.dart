import 'package:flutter/material.dart';

import '../../model/pickup_location.dart';
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
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: List.generate(locations.length, (index) {
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

      ),
    );
  }
}