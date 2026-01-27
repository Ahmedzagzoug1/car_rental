import 'package:car_rental/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
class PaymentDetailRow extends StatelessWidget {
  final String label;
  final String value;
  TextStyle? labelStyle;
  TextStyle? valueStyle;

   PaymentDetailRow({super.key, required this.label, required this.value,this.labelStyle,this.valueStyle});

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
          Text(label,
        style:labelStyle?? Theme.of(context).textTheme.titleSmall,)
      ,
          const Spacer(),
          Text(value,
          style:valueStyle?? Theme.of(context).textTheme.labelSmall,)
        ],

    );
  }
}
