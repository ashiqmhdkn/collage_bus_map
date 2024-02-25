import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'user.dart';

class UserController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  final RxList<User> users = <User>[].obs;
  final RxBool isLoading = true.obs;

  get errorMessage => null;

  get hasError => null;

  Future<void> createUser(User user) async {
    // Ensure class names are capitalized as per Dart conventions
    try {
      if (user.admissionNo == null) {
        // Handle the case where admissionNo is null or not set
        print("Error: admissionNo is null");
        return;
      }
      await _usersCollection.doc(user.admissionNo).set(user
          .toJson()); // Using .doc(user.admissionNo) to specify the document ID
      // Handle success scenario, e.g., show a success message
    } catch (e) {
      // Handle errors appropriately
      print("Error creating user: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
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
}
