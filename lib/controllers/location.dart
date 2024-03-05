import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FeedbackController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
 Future<void> submitFeedback(LatLng tealoc) async {
    try {
      await _firebaseFirestore
          .collection('feedback')
          .add(tealoc.toJson());
    } catch (e) {
      print("Error submitting feedback: $e");
    }
  }}
