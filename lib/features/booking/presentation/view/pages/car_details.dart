import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/features/booking/data/model/host_model.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/book_now_widget.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/car_view_pager.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/date_details.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/distance_details.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/host_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_components/data/models/car_model.dart';
class CarDetails extends StatelessWidget {
  CarModel? carModel;
   CarDetails({super.key, this.carModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(child:  Icon(Icons.arrow_back_ios),
        onTap: (){Navigator.pop(context);}),
        actions: [
          IconButton(onPressed: (){

          }, icon:Icon( Icons.favorite_outline_outlined))
        ],
        backgroundColor: ColorManager.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                      //    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    SizedBox(
                      height: 251.h,
            
                    child: CarViewPager(),
                    ),
            
              //  CarDetailsWidget( carModel: CarModel(),),
                    SizedBox(height: 20.h,),
            
                //    HostDetails(hostModel: HostModel.fakeHosts[0],),
                    SizedBox(height: 20.h,),
            
                    DateDetails(),
                    SizedBox(height: 20.h,),
                    DistanceDetails(pickupLocations: [],)
                  ]
            
                ),
              ),
            ),
          ),
          SizedBox(
              height: 91.h,
              child: BookNowWidget(originalPrice: 20,pricePerHour: 30,))
        ],
      ),
    );
  }
}
