import 'package:collage_bus_nufa/controllers/location.dart';
import 'package:collage_bus_nufa/controllers/messagecon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'locationmap.dart';
import 'message_page.dart';
import 'package:location/location.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocationController locationController = Get.put(LocationController());
      

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<void>(
          future: locationController.fetchLocationData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.error != null) {
              return Center(child: Text('Failed to get location'));
            } else {
              return Column(
                children: [
                  Expanded(
                      flex: 10,
                      child: Obx(()  {
                        LocationData? locationData =
                            locationController.locationData.value;

                        if (locationData == null) {
                          // Access locationData's properties here
                          double latitude = 10.902752012224196;
                          double longitude = 76.12170400178304;
                          
                        }
                
                        return LocationMap(locationData: locationData,);
                      })),
                  bottomWidget(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}



Widget bottomWidget() {
  final FeedbackController msg = Get.put(FeedbackController());
  final LocationController locationController = Get.put(LocationController());
  return FutureBuilder<String?>(
    future: getUserType(),
    builder: (context, snapshot) {
      if (snapshot.data == 'teacher') {
        return Expanded(
          flex: 1,
          child: ListTile(
            title: Text("Live Location"),
            trailing: Obx(() {
              return Switch(
                value: locationController.teacher.value,
                onChanged: (value) {
                  locationController.toggleTeacher();
                },
              );
            }),
          ),
        );
      } else {
        return Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              String currentUser = sp.getString('Id') ?? '';
              await msg.fetchFeedback(receiverId: currentUser);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagePage(
                    currentUser: currentUser,
                  ),
                ),
              );
            },
            child: ListTile(
              title: Text("Fees"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        );
      }
    },
  );
}

Future<String?> getUserType() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  bool? userType = sp.getBool('teach') ?? false;
  if (userType == false) {
    return null; // User
  } else {
    return 'teacher'; // Teacher
  }
}
