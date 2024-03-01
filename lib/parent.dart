import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:collage_bus_nufa/updateusers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'controllers/usercontrol.dart';

class parent extends StatefulWidget {
  parent({super.key});

  @override
  State<parent> createState() => parentState();
}

final UserController userController = Get.put(UserController());

class parentState extends State<parent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          title: Text("Student"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(add_parent());
          },
          child: Icon(Icons.add),
          backgroundColor: const Color.fromARGB(255, 83, 160, 223),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          tooltip: "Add a Student",
        ),
        body: Obx(() {
          if (userController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: userController.users.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(userController.users[index].name!),
                  subtitle:
                      Text(userController.users[index].password ?? 'what'),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              userController.deleteUser(
                                  userController.users[index].name!);
                            },
                            icon: Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {
                              Get.to(update_parent(userController.users[index]));
                            },
                            icon: Icon(Icons.edit)),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}

// ignore: must_be_immutable
