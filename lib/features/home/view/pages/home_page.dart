import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/features/home/view/widgets/custom_appbar.dart';
import 'package:car_rental/features/home/view/widgets/custom_cars_listview.dart';
import 'package:car_rental/features/home/view/widgets/custom_top_brand_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  RPadding(
        padding:const EdgeInsets.all(AppPadding.p20),
        child: Scaffold(
          body: Column(

            children: [
              const  CustomAppbar(),
              AppSize.s14.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Rent a Car anytime',style: Theme.of(context).textTheme.headlineLarge,),
                  ElevatedButton(onPressed: (){

                  },

                    style: Theme.of(context).elevatedButtonTheme.style,
                  child:const Text('Host & Earn' ,),
                  ),

                ],
              ),
              AppSize.s14.verticalSpace,

              //text field

                 TextField(

                decoration: InputDecoration(
                    fillColor: ColorManager.inputBackgroundColor,
filled: true,
                    hintText: 'Search any car...',

                    prefixIcon:Icon(Icons.search_rounded) ,
                    suffixIcon: Icon(CupertinoIcons.arrow_down)
                ),
              ),
              AppSize.s14.verticalSpace,
              //Top Brands

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Brands',style:Theme.of(context).textTheme.headlineLarge ,),
                  Text('View all',style:Theme.of(context).textTheme.displayMedium ,),

                ],
              ),
              AppSize.s14.verticalSpace,
 const CustomTopBrandList(),
              AppSize.s14.verticalSpace,
//Top Rated Cars
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Rated Cars',style:Theme.of(context).textTheme.headlineLarge ,),
                  Text('View all',style:Theme.of(context).textTheme.displayMedium ,),

                ],
              ),
              AppSize.s14.verticalSpace,
              const CustomCarsListview()

            ],
          ),
        ),
      ),
    );
  }
}
