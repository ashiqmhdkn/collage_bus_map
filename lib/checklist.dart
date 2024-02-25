import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:collage_bus_nufa/controllers/models/usercontrol.dart';
import 'package:collage_bus_nufa/parent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        title:  ListTile(
          title: Text("CheckList",style:TextStyle(fontSize: 20),),
          trailing: IconButton(onPressed: (){
            
          }, icon:Icon(Icons.search)),
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
                        Column(
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

  // Widget _showJourneyDetails(User user) {
  //   // showModalBottomSheet(
  //   //   context: context,
  //   //   builder: (BuildContext context) {
  //       return

  // }
}
