import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/features/home/data/data_source/cars_data_source/car_remote_data_source.dart';
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:car_rental/features/home/presentation/view/widgets/car_item_widget.dart';
import 'package:car_rental/features/home/presentation/view_model/providers/car_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class CustomCarsListview extends StatelessWidget {
  const CustomCarsListview({super.key});

  @override
  Widget build(BuildContext context) {
  /*  return
      Consumer<CarProvider>(
        builder: (context, carProvider, child) {
          switch (carProvider.state) {
            case CarState.initial:
              return const Center(child: Text('Press the refresh button to load users.'));
            case CarState.loading:
              print('loasing..........');
              return const Center(child: CircularProgressIndicator());
            case CarState.loaded:
              return
                SizedBox(
                  height: AppSize.s206,
                  child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: carProvider.cars.length,
                      physics: BouncingScrollPhysics(), itemBuilder: (context,index){
                        return CarItemWidget(carEntity: carProvider.cars[index],);
                      }),
                );


            case CarState.error:
              return Center(child: Text('Error: ${carProvider.errorMessage}'));
          }
        },
      );

*/
    return FutureBuilder(
        future:context.read<CarProvider>().fetchCars(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            print('done-------------');

            return Consumer<CarProvider>(builder: (context,carProvider,child)
            {
              return SizedBox(
                height: AppSize.s206.sp,
                child: ListView.builder(itemCount: carProvider.cars.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CarItemWidget(
                      carEntity: carProvider.cars[index],);
                  },),);
            });
          } else {
            return Text('No Data found');
          }
        }
    );


  }
}
