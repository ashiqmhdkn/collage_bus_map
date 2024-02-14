import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

  LatLng collegeLat = LatLng(10.902752012224196, 76.12170400178304);
  LatLng startingLat = LatLng(10.871674657929175, 75.93404357896162);
  
class locationmap extends StatelessWidget {
 locationmap({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(initialCameraPosition: CameraPosition(
        target: startingLat,
        zoom: 11,),
        markers:{
          Marker(markerId: MarkerId("starting"),
          position: startingLat,
          ),
          Marker(markerId: MarkerId("collage"),
          position: collegeLat,
          ),
        } ,
      ),
    );
  }
}