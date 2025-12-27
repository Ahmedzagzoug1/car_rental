import 'package:flutter/material.dart';
class PaymentDetailRow extends StatelessWidget {
  final String label;
  final String value;
  const PaymentDetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label,
      style: Theme.of(context).textTheme.labelMedium,)
    ,
        const Spacer(),
        Text(value,
        style: Theme.of(context).textTheme.displayMedium,)
      ],
    );
  }
}
