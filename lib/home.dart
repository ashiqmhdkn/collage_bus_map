import 'package:flutter/material.dart';
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
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
