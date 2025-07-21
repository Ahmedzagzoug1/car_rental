import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/features/booking/model/car_model.dart';
import 'package:flutter/material.dart';
class CarDetailsWidget extends StatelessWidget {
  final CarModel? carModel;
  const CarDetailsWidget({super.key,this.carModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(carModel!.name,style: Theme.of(context).textTheme.headlineLarge,),
            Row(
         children: [
           Icon(Icons.star,color: ColorManager.green,),
           Text('${carModel!.rate} . ${carModel!.trips} trips',
             style: Theme.of(context).textTheme.displayMedium,),

         ],
            ),
          ],
        ),
        Text('\$ ${carModel!.price} /h',style: Theme.of(context).textTheme.headlineLarge, )
      ],
    );
  }
}
