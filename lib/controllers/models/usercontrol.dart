import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'user.dart'; // Ensure this path is correct

class UserController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  final RxList<User> users = <User>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> createUser(User user) async {
    try {
      if (user.admissionNo == null) {
        print("Error: admissionNo is null");
        return;
      }
      await _usersCollection.doc(user.admissionNo).set(user.toJson());
    } catch (e) {
      print("Error creating user: $e");
    }
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      final QuerySnapshot<Object?> snapshot = await _usersCollection.get();
      users.assignAll(snapshot.docs
          .map((doc) => User.fromJson(doc.data() as Map<String, dynamic>))
          .toList());
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateUserJourney(String userId, Journey newJourney) async {
    try {
      DocumentReference userDoc = _usersCollection.doc(userId);
      DocumentSnapshot snapshot = await userDoc.get();
      if (snapshot.exists) {
        User user = User.fromJson(snapshot.data() as Map<String, dynamic>);
        if (user.journeys != null) {
          user.journeys!.add(newJourney);
        } else {
          user.journeys = [newJourney];
        }
        await userDoc.update(user.toJson());
      }
    } catch (e) {
      print("Error updating user journey: $e");
    }
  }
}
