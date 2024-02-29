import 'package:collage_bus_nufa/bottom.dart';
import 'package:collage_bus_nufa/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:collage_bus_nufa/controllers/models/usercontrol.dart';


class Checklist extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  // Initialize UserController
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "CheckList",
            style: TextStyle(fontSize: 20),
          ),
          trailing: IconButton(onPressed: () {
              Get.off(search());
          }, icon: Icon(Icons.search)),
        ),
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
                    subtitle: Text("Admission No: ${user.password}"),
                    onTap: () {
                      Get.bottomSheet(
                        bottom(user: user),
                      );
                      // Get.bottomSheet(
                      //   Column(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: user.journeys != null
                      //         ? user.journeys!.map((journey) {
                      //             return ListTile(
                      //               title: Text("Date: ${journey.date}"),
                      //               subtitle: Text(
                      //                   "Entry: ${journey.entry}, Exit: ${journey.exit}"),
                      //             );
                      //           }).toList()
                      //         : [Text("No journeys recorded")],
                      //   ),
                      // );
                    },
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
}

