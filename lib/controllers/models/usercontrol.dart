import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'user.dart';

class UserController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');

  final RxList<user> users = <user>[].obs;
  final RxBool isLoading = true.obs;

  get errorMessage => null;

  get hasError => null;

  Future<void> createUser(user user) async {
    try {
      await _usersCollection.add(user.tojson());
      // Handle success scenario
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
      users.assignAll(snapshot.docs.map((doc) => user.fromjson(doc.data() as Map<String, dynamic>)).toList());
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
