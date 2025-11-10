import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/core/resources/style_manager.dart';

class PickUpLocationPage extends StatefulWidget {
  const PickUpLocationPage({Key? key}) : super(key: key);

  @override
  State<PickUpLocationPage> createState() => _PickUpLocationPageState();
}

class _PickUpLocationPageState extends State<PickUpLocationPage> {
  final MapController _mapController = MapController();

  // بيانات ثابتة مع lat/lng عشان الماب
  final List<Map<String, dynamic>> locations = [
    {
      "id": "1",
      "name": "Alexandria - Airport",
      "description": "North Coast Location",
      "price": 50,
      "lat": 31.2001,
      "lng": 29.9187,
    },
    {
      "id": "2",
      "name": "Cairo - Nasr City",
      "description": "Main City Office",
      "price": 60,
      "lat": 30.0444,
      "lng": 31.2357,
    },
    {
      "id": "3",
      "name": "New Cairo",
      "description": "Branch 5th Settlement",
      "price": 70,
      "lat": 30.0219,
      "lng": 31.5036,
    },
    {
"id": "4",
"name": "My Place",
"description": "Branch 5th Settlement",
"price": 70,
"lat": 30.0219,
"lng": 31.5036,
},
  ];

  String? selectedLocationId;

  @override
  void initState() {
    super.initState();
    // initial selected = first location (طلبت Marker على أول مكان)
    selectedLocationId = locations.first["id"] as String;

    // move camera after first frame to ensure map is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final first = locations.first;
      _moveCamera(first["lat"] as double, first["lng"] as double, 14.0);
    });
  }

  void _moveCamera(double lat, double lng, double zoom) {
    try {
      _mapController.move(LatLng(lat, lng), zoom);
    } catch (_) {
      // in some rare cases controller not ready; ignore silently
    }
  }

  Map<String, dynamic> _getSelectedLocation() {
    return locations.firstWhere((loc) => loc["id"] == selectedLocationId,
        orElse: () => locations.first);
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil must be initialized in upper widget (usually in main)
    final selected = _getSelectedLocation();
    final double mapHeight = MediaQuery.of(context).size.height * 0.45;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pick Up Location",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),

      // BODY: Map top ~45% + Bottom container with list
      body: Column(
        children: [
          // MAP SECTION (top ~45%)
          RSizedBox(
            height: mapHeight,
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: LatLng(selected["lat"] as double, selected["lng"] as double),
                initialZoom: 14.0,
                // enable interactive features as needed
                interactionOptions:InteractionOptions(flags: InteractiveFlag.all) ,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'com.example.app',
                ),
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.de/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.example.car_rental',
                ),


                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(selected["lat"] as double, selected["lng"] as double),
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

          // BOTTOM CONTAINER (rounded, shadow) - list inside
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p16.w,
                vertical: AppPadding.p12.h,
              ),
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.r,
                    offset: Offset(0, -3.h),
                  ),
                ],
              ),
              child: ListView.separated(
                itemCount: locations.length,
                separatorBuilder: (_, __) => Divider(
                  thickness: 1.h,
                  color: ColorManager.grey,
                ),
                itemBuilder: (context, index) {
                  final location = locations[index];
                  final String id = location["id"] as String;
                  final String name = location["name"] as String;
                  final String desc = location["description"] as String;
                  final int price = location["price"] as int;
                  final bool isSelected = selectedLocationId == id;

                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedLocationId = id;
                      });
                      _moveCamera(location["lat"] as double, location["lng"] as double, 14.0);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppPadding.p12.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Price on LEFT (كما اتفقنا)
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: ColorManager.inputBackgroundColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              "$price EGP",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),

                          SizedBox(width: 12.w),

                          // Name & description
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: Theme.of(context).textTheme.headlineLarge,
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  desc,
                                  style: Theme.of(context).textTheme.displayMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),

                          // radio on the RIGHT
                          Radio<String>(
                            value: id,
                            groupValue: selectedLocationId,
                            activeColor: ColorManager.green,
                            onChanged: (value) {
                              setState(() {
                                selectedLocationId = value;
                              });
                              final loc = locations.firstWhere((l) => l["id"] == value);
                              _moveCamera(loc["lat"] as double, loc["lng"] as double, 14.0);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      // Save button ثابت في الأسفل (SafeArea)
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.all(AppPadding.p12.h),
        child: SizedBox(
          height: 52.h,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: selectedLocationId == null
                ? null
                : () {
              // TODO: إرسال الـ selectedLocationId أو الـ object كامل حسب الحاجة
              final selected = _getSelectedLocation();
              // مثال: print أو ارسل للـ Bloc
              debugPrint("Saved location id: ${selected['id']}, name: ${selected['name']}");
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
  }
}
