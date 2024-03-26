import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationController extends GetxController {
  Rx<LocationData?> locationData = Rx<LocationData?>(null);
  bool isCurrentUserAdmin = false;
  RxBool teacher = RxBool(false);
  void toggleTeacher() {
    teacher.value = !teacher.value; // Update the value
  }

  // Firebase collection reference
  final CollectionReference _locationCollection =
      FirebaseFirestore.instance.collection('locations');

  @override
  void onInit() async {
// Set to true for admin user, false for regular user
    super.onInit();
  }

  Future<void> fetchLocationData() async {
    if (teacher == true) {
      // Fetch current location only for admin user
      await _fetchCurrentLocation();
    } else {
      // Fetch location data from Firebase for regular user
      await _fetchLocationDataFromFirebase();
    }
  }

  Future<void> _fetchCurrentLocation() async {
    Location location = Location();
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

    // Get the current location
    locationData.value = await location.getLocation();

    // Add the current location to Firebase
    await _addLocationToFirebase(locationData.value);
  }

  Future<void> _addLocationToFirebase(LocationData? location) async {
    if (location != null) {
      try {
        // Convert LocationData to a map
        Map<String, dynamic> locationMap = {
          'latitude': location.latitude,
          'longitude': location.longitude,
          // Add more fields if needed
        };

        // Add the location data to Firebase
        //  await _locationCollection.add(locationMap);
        await _locationCollection
            .doc("busLocation")
            .set(locationMap, SetOptions(merge: true));
      } catch (e) {
        print('Error adding location to Firebase: $e');
      }
    }
  }

  Future<void> _fetchLocationDataFromFirebase() async {
    try {
      QuerySnapshot snapshot = await _locationCollection.get();
    } catch (e) {
      print('Error retrieving location data from Firebase: $e');
    }
  }
}
