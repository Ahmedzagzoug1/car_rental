import 'package:car_rental/features/home/top_brand_model.dart';
import 'package:car_rental/features/home/view/widgets/BrandWidget.dart';
import 'package:flutter/material.dart';
class CustomTopBrandList extends StatelessWidget {
  const CustomTopBrandList({super.key});

  @override
  Widget build(BuildContext context) {
    final topBrands=TopBrandModel.AllBrands;
    return ListView.builder(itemCount: topBrands.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
      return Brandwidget(topBrandModel: topBrands[index],);
    });
  }
}
