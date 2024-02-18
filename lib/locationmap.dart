import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Maps Polyline Example'),
        ),
        body: LocationMap(),
      ),
    );
  }
}

class LocationMap extends StatelessWidget {
  // It's good practice to have keys start with lowercase letters
  LocationMap({Key? key}) : super(key: key);

  // Define starting and destination LatLng
  final LatLng collegeLat = LatLng(10.902752012224196, 76.12170400178304);
  final LatLng startingLat = LatLng(10.871674657929175, 75.93404357896162);

  // Define a polyline between starting and destination points
  final Polyline _kPolyline = Polyline(
    polylineId: PolylineId('route'), // Corrected the property name
    points: [
      LatLng(10.902752012224196, 76.12170400178304),
      LatLng(10.871674657929175, 75.93404357896162),
    ],
    color: Colors.blue,
    width: 5,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: startingLat,
        zoom: 11,
      ),
      polylines: {
        _kPolyline,
      },
      markers: {
        Marker(
          markerId: MarkerId("starting"),
          position: startingLat,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
        Marker(
          markerId: MarkerId("college"),
          position: collegeLat,
        ),
      },
    );
  }
}
