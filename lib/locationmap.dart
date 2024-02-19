import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart'; // Assuming you want to use this

class LocationMap extends StatelessWidget {
  final LocationData? locationData; // Optional location data

  LocationMap({Key? key, this.locationData}) : super(key: key);

  final LatLng collegeLat = LatLng(10.902752012224196, 76.12170400178304);
  final LatLng startingLat = LatLng(10.871674657929175, 75.93404357896162);
  final LatLng valancheryLat = LatLng(10.887939, 76.073187);
  final LatLng thriunavayaLat = LatLng(10.865801, 75.984058);
  final LatLng kanchipuraLat = LatLng(10.916988, 76.040974);
  final LatLng vettichiraLat = LatLng(10.928812, 76.023188);
  final LatLng puthanathaniLat = LatLng(10.934784, 76.005294);

  @override
  Widget build(BuildContext context) {
    final Polyline _kPolyline = Polyline(
      polylineId: PolylineId('route'),
      points: [
        collegeLat,
        valancheryLat,
        puthanathaniLat,
        thriunavayaLat,
        startingLat,
      ],
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
          markerId: MarkerId("puthanathani"),
          position: puthanathaniLat,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
        Marker(
          markerId: MarkerId("vettichira"),
          position: vettichiraLat,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
        Marker(
          markerId: MarkerId("kanchipura"),
          position: kanchipuraLat,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
        Marker(
          markerId: MarkerId("thirunavaya"),
          position: thriunavayaLat,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
        Marker(
          markerId: MarkerId("valanachery"),
          position: valancheryLat,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
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
