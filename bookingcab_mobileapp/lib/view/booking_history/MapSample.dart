

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MyAppState();
}

class _MyAppState extends State<MapScreen> {
 
 /* late GoogleMapController mapController;

  final LatLng _center = const LatLng(12.847810, 77.663190);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          elevation: 2,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
  */

  GoogleMapController? mapController;
  Set<Marker> markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      markers.add(Marker(
        markerId: MarkerId('marker1'),
        position: LatLng(12.847810, 77.663190),
        infoWindow: InfoWindow(title: 'San Francisco'),
      ));
    });
  }

 @override
  void initState() {
    super.initState();

   //permission();
  }

/*
void permission() async {
   // Request location permission
            PermissionStatus status = await Permission.location.request();
            print('Location permission status: $status');

            // Request access to the device's GPS
            status = await Permission.locationWhenInUse.request();
            print('GPS permission status: $status');

            // Request map permission (if required)
            // Replace this with the appropriate permission for your map plugin
            status = await Permission.locationWhenInUse.request();
            print('Map permission status: $status');
}
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Maps in Flutter')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(12.847810, 77.663190),
          zoom: 12,
        ),
        markers: markers,
      ),
    );
  }
}