import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class authController extends GetxController {
  final CollectionReference db = FirebaseFirestore.instance.collection('user');
  void registerUser(String username, String email, String password) async {
    try {
      if (username.isNotEmpty && password.isNotEmpty && email.isNotEmpty) {}
    } catch (e) {}
  }
}
