import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/constants_manager.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../cubit/location_cubit/location_cubit.dart';

class MapWidget extends StatefulWidget {
  final PickupLocationEntity pickupLocationEntity;
  const MapWidget({super.key,required this.pickupLocationEntity});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  return  BlocProvider(
      create: (_) => sl<LocationCubit>()..getCurrentLocation(),
      child: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          if (state is LocationLoaded) {
            return FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(state.location.latitude, state.location.longitude),
                initialZoom: 14,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                MarkerLayer(
                  markers: [


                    (state.location is Position )?                    Marker(
                      point: LatLng(state.location.latitude, state.location.longitude),
                      child: const Icon(Icons.my_location, color: Colors.blue, size: 40),
                    ):
                    Marker(
                      point: LatLng(30.74007173979984, 31.585461507698227),
                      child: const Icon(Icons.my_location, color: Colors.blue, size: 40),
                    )
                    ,
                    Marker(
                      point: LatLng( 30.722487364240795,30.722487364240795),
                      child: const Icon(Icons.my_location, color: Colors.blue, size: 40),
                    )
                  ],
                ),
              ],
            );
          }
          if (state is LocationError) return Text(state.message);
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );

/*
    return FlutterMap(
      options: MapOptions(
        initialCenter: _currentLatLng, // Center the map over London
        initialZoom: 9.2,
      ),
      children: [
        TileLayer( // Bring your own tiles
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
          userAgentPackageName: 'com.example.car_rental', // Add your app identifier
          // And many more recommended properties!
        ),
        MarkerLayer(markers: [
        Marker(point:
        LatLng(widget.pickupLocationEntity.latLng.longitude, widget.pickupLocationEntity.latLng.latitude),
                  child: Column(
    children: [
    const Icon(Icons.location_pin, color: Colors.red, size: 40),
    Container(
    color: Colors.white,
    padding: const EdgeInsets.all(2),
    child: Text('car', style: const TextStyle(fontSize: 10)),
    ),
    ],
    ),),
          Marker(point:
          _currentLatLng,
            child: Column(
              children: [
                const Icon(Icons.location_pin, color: Colors.red, size: 40),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(2),
                  child: Text('car', style: const TextStyle(fontSize: 10)),
                ),
              ],
            ),)
        ]),
        RichAttributionWidget( // Include a stylish prebuilt attribution widget that meets all requirments
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')), // (external)
            ),
            // Also add images...
          ],
        ),
      ],
    );
  }
 late LatLng _currentLatLng;
  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentLatLng = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print('Error getting location: $e');
    }*/
  }
}


