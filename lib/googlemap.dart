import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {

  late GoogleMapController mapController;
  final LatLng _center = const LatLng(9.9252, 78.1198);

  Set<Marker> markers = {
    Marker(
      markerId: MarkerId('marker'),
      position: LatLng(11.3410, 77.7172),
      infoWindow: InfoWindow(title: 'Location', snippet: 'place'),
    ),
    Marker(
      markerId: MarkerId('marker'),
      position: LatLng(11.3410, 77.7172),
      infoWindow: InfoWindow(title: 'Erode', snippet: 'place'),
    ),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map Concept'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
          mapType: MapType.satellite,
          initialCameraPosition: CameraPosition(target: _center,zoom: 20),
      markers: markers,),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
