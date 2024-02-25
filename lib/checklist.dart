import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Make sure to add get package to your pubspec.yaml
import 'user.dart';
import 'user_controller.dart'; // Adjust this import based on your project structure

class Checklist extends StatefulWidget {
  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  final UserController userController =
      Get.put(UserController()); // Initialize UserController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Checklist"),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        // Use Obx here to listen to changes in UserController
        if (userController.isLoading.isTrue) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              User user = userController.users[index];
              return Column(
                children: [
                  ListTile(
                    title: Text(user.name ?? "Unknown"),
                    subtitle: Text("Admission No: ${user.admissionNo}"),
                    onTap: () => _showJourneyDetails(user),
                  ),
                  const Divider(),
                ],
              );
            },
          );
        }
      }),
    );
  }

  void _showJourneyDetails(User user) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: user.journeys != null
                ? user.journeys!.map((journey) {
                    return ListTile(
                      title: Text("Date: ${journey.date}"),
                      subtitle: Text(
                          "Entry: ${journey.entry}, Exit: ${journey.exit}"),
                    );
                  }).toList()
                : [Text("No journeys recorded")],
          ),
        );
      },
    );
  }
}
