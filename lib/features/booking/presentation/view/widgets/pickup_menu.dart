import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
class PickupMenu extends StatefulWidget {
  @override
  State<PickupMenu> createState() => _PickupLocationsScreenState();
}

class _PickupLocationsScreenState extends State<PickupMenu> {
 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
  builder: (context, state) {
    final locations=(state as LocationsLoaded).pickupLocations;
int selectedIndex=locations.length;
    return Padding(

        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height:AppSize.s316.h,
          child: ListView.builder(
              itemCount: locations.length,

              itemBuilder: (context,index){

              final loc = locations[index];
              return Card(
                margin:  EdgeInsets.symmetric(vertical: AppMargin.m6.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12.r)),
                child: RadioListTile(
                  value: index,
                  groupValue: selectedIndex,
                  onChanged: (value) {
                    setState(() {
                      selectedIndex = value!;
                    });
                  },
                  title: Text(loc.title, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(loc.subtitle),
 //                 secondary: Text(loc.price, style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              );

            }),
          ),


    );
  },
);
  }
}