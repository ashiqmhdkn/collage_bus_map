import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:collage_bus_nufa/controllers/models/usercontrol.dart';
import 'package:collage_bus_nufa/parent.dart';
import 'package:intl/intl.dart';

DateTime now = DateTime.now();
var formatterDate = DateFormat('dd/MM/yy');
var formatterTime = DateFormat('kk:mm');
String actualDate = formatterDate.format(now);
String actualTime = formatterTime.format(now);


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
          trailing: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
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

class bottom extends StatelessWidget {
  User user;
  bottom({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = DateTime.now().toString();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Expanded(
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: user.journeys!.isEmpty
                      ? [
                          ListTile(
                            title: Text("Date: ${DateTime.now()}"),
                            subtitle: Text("the morning enter"),
                          )
                        ]
                      : user.journeys!.map((journey) {
                          return ListTile(
                            title: Text("Date: ${journey.date}"),
                            subtitle: Text(
                                "Entry: ${journey.entry}, Exit: ${journey.exit}"),
                          );
                        }).toList(),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Cancel")),
                    ElevatedButton(
                        onPressed: () {
                          userController.updateUserJourney(
                              newJourney:
                                  Journey(date: date, entry: true, exit: false),
                                  userName: user.name,);
                        },
                        child: Text("InBus")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
