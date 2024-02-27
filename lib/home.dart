import 'package:collage_bus_nufa/map.dart';
import 'package:collage_bus_nufa/show_feedback.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'locationmap.dart';
import 'message_page.dart';
import 'package:location/location.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final Location location = Location();

  Future<LocationData?> checkLocationService() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    return await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<LocationData?>(
          future: checkLocationService(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.error != null || snapshot.data == null) {
              return Center(child: Text('Failed to get location'));
            } else {
              return Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: LocationMap(locationData: snapshot.data),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessagePage()),
                        );
                      },
                      child: ListTile(
                        title: Text("Quick Message"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // getDirections(
                        //   start: LatLng(10.902752012224196, 76.12170400178304),
                        //   end: LatLng(10.871674657929175, 75.93404357896162),
                        // );
                        Get.to(show_feedback());
                      },
                      child: null)
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
