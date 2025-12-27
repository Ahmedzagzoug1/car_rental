import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../core/routes/app_router.dart';
class PickupMenu extends StatefulWidget {
  const PickupMenu({super.key});

  @override
  State<PickupMenu> createState() => _PickupLocationsScreenState();
}

class _PickupLocationsScreenState extends State<PickupMenu> {
 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
  builder: (context, state) {
    if (state is LocationsLoaded) {
      final locations = state.pickupLocations;
      int selectedIndex = locations.length;
      return Column(
        children: [
          Padding(

            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: AppSize.s316.h,
              child: ListView.builder(
                  itemCount: locations.length,

                  itemBuilder: (context, index) {
                    final loc = locations[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: AppMargin.m6.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius
                          .circular(AppSize.s12.r)),
                      child: RadioListTile(
                        value: index,
                        groupValue: selectedIndex,
                        onChanged: (value) {
                          setState(() {
                            selectedIndex = value!;
                          });
                        },
                        title: Text(loc.title,
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(loc.subtitle),
                        //                 secondary: Text(loc.price, style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    );
                  }),
            ),


          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, AppRouter.carDetailsRoute);
                },

                    style: Theme
                        .of(context)
                        .elevatedButtonTheme
                        .style,
                    child: const Text('save')
                ),
              ),
            ),
          ),
        ],
      );
    }else if(state is LocationLoading){
      return const Center(child: CircularProgressIndicator(),);
    }else{
      return Center(child: Text((state as LocationError).errMessage),);
    }
  }

);
  }
}