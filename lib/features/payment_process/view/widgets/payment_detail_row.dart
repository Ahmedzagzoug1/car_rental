import 'package:flutter/material.dart';
class PaymentDetailRow extends StatelessWidget {

  final String label;
  final String value;
bool? isTotal;
  bool? isDiscount ;
   PaymentDetailRow({super.key,
  required this.label,
  required this.value,  isTotal = false,  isDiscount = false});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal! ? 18 : 16,
              fontWeight: isTotal! ? FontWeight.bold : FontWeight.normal,
              color: isTotal! ? Colors.black : Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal! ? 18 : 16,
              fontWeight: isTotal! ? FontWeight.bold : FontWeight.normal,
              color: isDiscount! ? Colors.grey[700] : Colors.black, // Discount can be grey if zero
            ),
          ),
        ],
      ),
    );;
  }
}
