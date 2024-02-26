import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

// class MyMap extends StatefulWidget {
//   const MyMap({super.key});

//   @override
//   State<MyMap> createState() => _MyMapState();
// }

// class _MyMapState extends State<MyMap> {
final List<Polyline> _polylines = [];

void getDirections({required start, required end}) async {
  String apiKey =
      'AIzaSyBAOUOgTTl35q0g3sKjCsOPDF40Vj3Eay0'; //  Google Maps API key
  String baseUrl = 'https://maps.googleapis.com/maps/api/directions/json';

  // Make a request to the Directions API
  Uri uri = Uri.parse(
      '$baseUrl?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&key=$apiKey');
  http.Response response = await http.get(uri);

  if (response.statusCode == 200) {
    print("......................ok......................");
    // Parse the JSON response
    Map<String, dynamic> data = json.decode(response.body);
    print(response.body);
    List<LatLng> points =
        _decodePolyline(data['routes'][0]['overview_polyline']['points']);

    // Create a polyline to display the route
    //   setState(() {
    _polylines.add(
      Polyline(
        polylineId: PolylineId('Route ${_polylines.length + 1}'),
        points: points,
        color: Colors.blue,
        //_getPolylineColor(_polylines.length),
        width: 5,
      ),
    );
    //  });
  }
}

// void _getOptimizedRoutes() {
//   for (int i = 0; i < widget.datas.length; i++) {
//     if (i == 0) {
//       LatLng start = LatLng(widget.serviceCenterData.first.latitude ?? 0,
//           widget.serviceCenterData.first.longitude ?? 0);
//       LatLng end = LatLng(widget.datas[i].contactInfo?.latitude ?? 0,
//           widget.datas[i].contactInfo!.longitude ?? 0);
//       _getDirections(start, end);
//     } else if (i == widget.datas.length - 1) {
//       LatLng start = LatLng(widget.datas[i].contactInfo?.latitude ?? 0,
//           widget.datas[i].contactInfo!.longitude ?? 0);
//       LatLng end = LatLng(widget.serviceCenterData.first.latitude ?? 0,
//           widget.serviceCenterData.first.longitude ?? 0);
//       _getDirections(start, end);
//     } else {
//       LatLng start = LatLng(widget.datas[i].contactInfo?.latitude ?? 0,
//           widget.datas[i].contactInfo!.longitude ?? 0);
//       LatLng end = LatLng(widget.datas[i + 1].contactInfo!.latitude ?? 0,
//           widget.datas[i + 1].contactInfo!.longitude ?? 0);

//       _getDirections(start, end);
//     }
//   }
// }
List<LatLng> _decodePolyline(String encoded) {
  List<LatLng> points = [];

  int index = 0;
  int len = encoded.length;
  int lat = 0;
  int lng = 0;

  while (index < len) {
    int b;
    int shift = 0;
    int result = 0;

    do {
      b = encoded.codeUnitAt(index++) - 63;
      result |= (b & 0x1F) << shift;
      shift += 5;
    } while (b >= 0x20);

    int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
    lat += dlat;

    shift = 0;
    result = 0;

    do {
      b = encoded.codeUnitAt(index++) - 63;
      result |= (b & 0x1F) << shift;
      shift += 5;
    } while (b >= 0x20);

    int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
    lng += dlng;

    points.add(LatLng(lat / 1E5, lng / 1E5));
  }

  return points;
}

  // @override
  // Widget build(BuildContext context) {
  //   return const Placeholder();
//    }
// }
