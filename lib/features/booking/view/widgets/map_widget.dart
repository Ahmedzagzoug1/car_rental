import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(51.509364, -0.128928), // Center the map over London
              initialZoom: 9.2,
            ),
            children: [
              TileLayer( // Bring your own tiles
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
                userAgentPackageName: 'com.example.car_rental', // Add your app identifier
                // And many more recommended properties!
              ),
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
          ),
        ),
      ],
    );
  }
}
