import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart'; // Assuming you want to use this

class LocationMap extends StatelessWidget {
  final LocationData? locationData; // Optional location data

  LocationMap({Key? key, this.locationData}) : super(key: key);

  final LatLng collegeLat = LatLng(10.902752012224196, 76.12170400178304);
  final LatLng startingLat = LatLng(10.871674657929175, 75.93404357896162);

  @override
  Widget build(BuildContext context) {
    final Polyline _kPolyline = Polyline(
      polylineId: PolylineId('route'),
      points: [collegeLat, startingLat],
      color: Colors.blue,
      width: 5,
    );

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: startingLat,
        zoom: 11,
      ),
      polylines: {_kPolyline},
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
        if (locationData !=
            null) // This is how you might start to use locationData
          Marker(
            markerId: MarkerId("currentLocation"),
            position: LatLng(locationData!.latitude!, locationData!.longitude!),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          ),
      },
    );
  }
}
