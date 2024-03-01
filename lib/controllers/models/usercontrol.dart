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
      if (user.name == null) {
        GetSnackBar(message: "Error: name is null");
        return;
      }

      await _usersCollection.doc().set(user.toJson());
    } catch (e) {
      GetSnackBar(message: "Error creating user: $e");
    }
  }

  Future<void> updateUser(String userName, User user) async {
    try {
      if (user.name == null) {
        GetSnackBar(message: "Error: name is null");
        return;
      }
      final QuerySnapshot userSnapshot =
          await _usersCollection.where('name', isEqualTo: userName).get();
      if (userSnapshot.docs.isNotEmpty) {
        String userId = userSnapshot.docs.first.id;
        await _usersCollection.doc(userId).update(user.toJson());
      }
    } catch (e) {
      GetSnackBar(message: "Error creating user: $e");
    }
  }

  Future<void> deleteUser(String userName) async {
    try {
      final QuerySnapshot userSnapshot =
          await _usersCollection.where('name', isEqualTo: userName).get();
      if (userSnapshot.docs.isNotEmpty) {
        String userId = userSnapshot.docs.first.id;
        await _usersCollection.doc(userId).delete();
      }
      // Handle success scenario
    } on FirebaseException catch (e) {
      // Handle errors appropriately
      print("Error: $e");
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
      GetSnackBar(message: "Error fetching users: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateUserJourney(
      {required Journey newJourney, String? userName}) async {
    try {
      final QuerySnapshot userSnapshot =
          await _usersCollection.where('name', isEqualTo: userName).get();
      if (userSnapshot.docs.isNotEmpty) {
        String userId = userSnapshot.docs.first.id;

        DocumentReference userDoc = _usersCollection.doc(userId);
        DocumentSnapshot snapshot = await userDoc.get();
        if (snapshot.exists) {
          User user = User.fromJson(snapshot.data() as Map<String, dynamic>);
          if (user.journeys != null) {
            final index = user.journeys!
                .indexWhere((journey) => journey.date == newJourney.date);
            if (index != -1) {
              // If a journey already exists for this date, update it
              user.journeys![index].entry =
                  newJourney.entry ?? user.journeys![index].entry;
              user.journeys![index].exit =
                  newJourney.exit ?? user.journeys![index].exit;
            } else {
              // If no journey exists for this date, add a new one
              user.journeys!.add(newJourney);
            }
          } else {
            user.journeys = [newJourney];
          }
          await userDoc.update(user.toJson());
        }
      } else {
        GetSnackBar(message: 'error in user $userName');
      }
    } catch (e) {
      GetSnackBar(message: "Error updating user journey: $e");
    }
  }
}
