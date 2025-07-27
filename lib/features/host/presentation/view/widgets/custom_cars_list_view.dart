import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/features/home/models/car_model.dart';
import 'package:car_rental/features/home/presentation/view/widgets/car_item_widget.dart';
import 'package:flutter/material.dart';
class CustomCarsListview extends StatelessWidget {
  const CustomCarsListview({super.key});

  @override
  Widget build(BuildContext context) {
    final cars=CarModel.cars;
    return SizedBox(
      height: AppSize.s206,
      child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: cars.length,
          physics: BouncingScrollPhysics(), itemBuilder: (context,index){
            return CarItemWidget(car: cars[index],);
          }),
    );
  }
}
