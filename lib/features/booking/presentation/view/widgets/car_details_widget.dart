import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:flutter/material.dart';
class CarDetailsWidget extends StatelessWidget {
  final CarDetailsEntity? car;
  const CarDetailsWidget({super.key,this.car});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(car!.name,style: Theme.of(context).textTheme.headlineLarge,),
            Row(
         children: [
           Icon(Icons.star,color: ColorManager.green,),
           Text('${car!.rate} . ${car!.trips} trips',
             style: Theme.of(context).textTheme.displayMedium,),

         ],
            ),
          ],
        ),
        Text('\$ ${car!.price} /h',style: Theme.of(context).textTheme.headlineLarge, )
      ],
    );
  }
}
