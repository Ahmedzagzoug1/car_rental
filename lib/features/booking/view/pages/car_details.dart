import 'package:car_rental/features/booking/model/car_model.dart';
import 'package:car_rental/features/booking/view/widgets/car_view_pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CarDetails extends StatelessWidget {
  CarModel carModel;
   CarDetails({super.key,required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(onPressed: (){}, icon:Icon( Icons.favorite_outline_outlined))
        ],
        backgroundColor: Colors.green.shade700,
        elevation: 0,
      ),
      body: Column(
        children: [
          CarViewPager(imagesUrl: carModel.imagesUrl,),
Padding(padding: EdgeInsets.only(top: 16.r,right: 16.r)
,child: Column(),)
        ]

      ),
    );
  }
}
