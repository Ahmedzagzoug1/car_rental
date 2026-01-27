import 'package:car_rental/features/host/presentation/view/widgets/custom_app_bar.dart';
import 'package:car_rental/features/host/presentation/view/widgets/custom_cars_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HostHomePage extends StatefulWidget {
  const HostHomePage({super.key});

  @override
  State<HostHomePage> createState() => _HostHomePageState();
}

class _HostHomePageState extends State<HostHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomAppbar(

          ),
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My Cars',style: Theme.of(context).textTheme.headlineLarge,),
              Text('+ Add New Car',style: Theme.of(context).textTheme.titleMedium,)

            ],
          ),
          CustomCarsListview(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My Orders',style:Theme.of(context).textTheme.headlineLarge ,),
              Text('View all',style:Theme.of(context).textTheme.displayMedium ,),

            ],
          ),
        ],
      ),
    );
  }
}
