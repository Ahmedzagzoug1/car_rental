import 'package:car_rental/features/home/top_brand_model.dart';
import 'package:flutter/material.dart';
class Brandwidget extends StatelessWidget {
  final TopBrandModel? topBrandModel;
   Brandwidget({super.key,this.topBrandModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(topBrandModel!.imageSrc),
        Text(topBrandModel!.brandName, style: Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }
}
