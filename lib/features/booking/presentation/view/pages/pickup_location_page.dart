import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';

import '../../cubit/booking_cubit/booking_cubit.dart';

class PickUpLocationPage extends StatefulWidget {
  const PickUpLocationPage({super.key});

  @override
  State<PickUpLocationPage> createState() => _PickUpLocationPageState();
}

class _PickUpLocationPageState extends State<PickUpLocationPage> {
  final MapController _mapController = MapController();

  late  List<PickupLocationEntity> locations ;
  int selectedLocationId=0;


  void _moveCamera(double lat, double lng, double zoom) {
    try {
      _mapController.move(LatLng(lat, lng), zoom);
    } catch (_) {
      print('controller not ready');
    }
  }
/*
  Map<String, dynamic> _getSelectedLocation() {
    return locations.firstWhere((loc) => loc["id"] == selectedLocationId,
        orElse: () => locations.first);
  }
*/
  @override
  Widget build(BuildContext context) {


       return BlocBuilder<LocationCubit, LocationState>(
  builder: (context, state) {
    if(state is LocationsLoaded) {
      locations=state.pickupLocations;
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Pick Up Location",
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineLarge,
            ),
            centerTitle: true,
          ),
      
          body: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.45,
                    child: FlutterMap(
                      mapController: _mapController,
                      options: MapOptions(
                        initialCenter: LatLng(
                            locations[selectedLocationId].lat ,
                            locations[selectedLocationId].lng ),
                        initialZoom: 14.0,
                        // enable interactive features as needed
                        interactionOptions: const InteractionOptions(
                            flags: InteractiveFlag.all),
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                          subdomains: const ['a', 'b', 'c'],
                          userAgentPackageName: 'com.example.car_rental',
                        ),
                  
                  
                  
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: LatLng(locations[selectedLocationId].lat,
                                  locations[selectedLocationId].lng),
                              width: 48.w,
                              height: 48.h,
                              child: Icon(
                                Icons.location_pin,
                                size: 48,
                                color: ColorManager.red,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  //list of locations
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p16.w,
                        vertical: AppPadding.p12.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.r)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.r,
                            offset: Offset(0, -3.h),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*.5,
                        child: ListView.separated(
                            itemCount: locations.length,
                            separatorBuilder: (_, __) =>
                                Divider(
                                  thickness: 1.h,
                                  color: ColorManager.grey,
                                ),
                            itemBuilder: (context, index) {
                              final location = locations[index];
                  
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedLocationId = index;
                                  });
                                  _moveCamera(location.lat, location.lng, 14.0);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppPadding.p12.h),
                                  child: ListTile(
                                    leading: Radio(
                                      value: index,
                                      groupValue: selectedLocationId,
                                      activeColor: ColorManager.green,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLocationId = value!;
                                        });
                                        _moveCamera(
                                            location.lat, location.lng, 14.0);
                                      },
                                    ),
                                    title: Text(location.title),
                                    subtitle: Text(location.subtitle),
                                    trailing: Text('${location.price} eg'),
                                  ),
                  
                                ),
                  
                  
                              );
                            }),
                      ))
                ]),
          ),
      
        bottomNavigationBar: SafeArea(
          minimum: EdgeInsets.all(AppPadding.p12.h),
          child: SizedBox(
            height: 52.h,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                debugPrint("Saved location id: ${locations[selectedLocationId].title}");
                context.read<BookingCubit>().setPickup(locations[selectedLocationId]);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s16.sp),
                ),
              ),
              child: Text(
                "Save",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ),
      
          );
    }else if(state is LocationLoading){
      return const CircularProgressIndicator();
  }else{
      return const Center(child: Text('an expected error !!'),);

    }
       }
       );



  }
}
