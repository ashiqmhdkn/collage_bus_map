import 'package:collage_bus_nufa/controllers/models/feedbackmodel.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedbackController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  RxList<feedback> feedbackList = <feedback>[].obs;

  @override
  void onInit() {
    super.onInit();
// Fetch feedback messages on initialization
  }

  Future<void> fetchFeedback({String? senderId, String? receiverId}) async {
   
    try {
      QuerySnapshot querySnapshot;
      if (senderId != null && receiverId != null) {
        querySnapshot = await _firebaseFirestore
            .collection('feedback')
            .where('senderId', isEqualTo: senderId)
            .where('receiverId', isEqualTo: receiverId)
            .get();
      } else if (senderId != null) {
        querySnapshot = await _firebaseFirestore
            .collection('feedback')
            .where('senderId', isEqualTo: senderId)
            .get();
      } else if (receiverId != null) {
        querySnapshot = await _firebaseFirestore
            .collection('feedback')
            .where('receiverId', isEqualTo: receiverId)
            .get();
      } else {
        querySnapshot = await _firebaseFirestore.collection('feedback').get();
      }
      feedbackList.assignAll(querySnapshot.docs
          .map((doc) => feedback.fromJson(doc.data() as Map<String, dynamic>))
          .toList());
    } catch (e) {
      print("Error fetching feedback: $e");
    }
  }

  Future<void> submitFeedback(feedback feedback) async {
    try {
      await _firebaseFirestore.collection('feedback').add(feedback.toJson());
    } catch (e) {
      print("Error submitting feedback: $e");
    }
  }
}
