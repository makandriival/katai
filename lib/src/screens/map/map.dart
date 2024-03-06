import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:katai/src/utils/permission_handler.dart';
import 'package:latlong2/latlong.dart';

final LocationService locationService = LocationService();

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  static const routeName = '/map';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: FutureBuilder<LatLng>(
        future: locationService.determinePosition(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            print('Error loading initial location: ${snapshot.error}');
            // Handle the error, show a message, or set a default location
            return const Center(
              child: Text('Error loading location'),
            );
          } else {
            final initialLocation = snapshot.data!;
            print(initialLocation.toString());
            return FlutterMap(
              options: MapOptions(
                initialCenter: initialLocation,
                initialZoom: 9.2,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      onTap: () => print('OpenStreetMap attribution tapped!'),
                    ),
                  ],
                ),
                CurrentLocationLayer(),
              ],
            );
          }
        },
      ),
    );
  }
}
