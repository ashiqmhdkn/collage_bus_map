import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'user.dart';

class UserController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
 late final CollectionReference _usersCollection =
      firestore.collection('users');

  Future<void> createUser(user user) async {
    try {
      // Convert the User object to a Map using toJson()
      await _usersCollection.add(user.tojson());
      // Handle success scenario
    } on FirebaseException catch (e) {
      // Handle errors appropriately
      print("e");
    }
  }

  Future<List<user>> getUsers() async {
    try {
      // Get all documents from the "users" collection
      final QuerySnapshot<Object?> snapshot =
          await _usersCollection.get();

      // Convert each document snapshot to a User object using fromJson()
      final users =
          snapshot.docs.map((doc) => user.fromjson(doc.data()as Map<String,dynamic>)).toList();
      return users;
    } on FirebaseException catch (e) {
      // Handle errors appropriately
      return []; // Return an empty list on error
    }
  }
}
