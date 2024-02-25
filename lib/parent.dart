import 'dart:ffi';

import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import './controllers/models/usercontrol.dart';
import 'controllers/models/user.dart';

class parent extends StatefulWidget {
  parent({super.key});

  @override
  State<parent> createState() => parentState();
}

final UserController userController = Get.put(UserController());
late Future<List<user>> users = userController.getUsers();
class parentState extends State<parent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          appBar: AppBar(
            title: Text("Parent"),
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
            tooltip: "Add a Parent",
          ),
          body:  Obx(() {
          if (userController.isLoading.value) {
            return CircularProgressIndicator(); // Show a loading indicator while data is being fetched
          } else if (userController.hasError.value) {
            return Text('Error: ${userController.errorMessage.value}');
          } else {
            // If data is available, display it
            late Future<List<user>> users = userController.getUsers();
            if (users != null && users.isNotEmpty) {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index].name), // Assuming User class has a 'name' property
                    // Other user details can be displayed similarly
                  );
                },
              );
            } else {
              return Text('No users found.');
            }
          }
        }),),
    );
  }
}

class add_parent extends StatelessWidget {
  add_parent({super.key});
  TextEditingController pname = TextEditingController();
  TextEditingController pAdmissionNo = TextEditingController();
  TextEditingController pAddress = TextEditingController();
  TextEditingController pPhone = TextEditingController();
  TextEditingController pDob = TextEditingController();
  Future<void> addDbparent(
      {String? name,
      String? Adress,
      String? dob,
      String? phone,
      String? AdmissionNo}) async {
    print(name);
    print(Adress);
    print(dob);
    print(phone);
    print(AdmissionNo);
    userController.createUser(user(
      name: name,
      address: Adress,
      password: dob,
      admissionNo: AdmissionNo,
      phone: phone,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Parent"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              TextField(
                controller: pname,
                decoration: InputDecoration(
                  label: Text("Name of Parent"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: pAdmissionNo,
                decoration: InputDecoration(
                  label: Text("Admission number"),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: pPhone,
                decoration: InputDecoration(
                  label: Text("Phone Number"),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: pAddress,
                decoration: InputDecoration(
                  label: Text(
                    "location",
                    style: TextStyle(),
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: pDob,

                decoration: InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.only(
                      left: 150,
                      right: 150,
                      top: 10,
                      bottom: 10,
                    ),
                  ),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                onPressed: () async {
                  await addDbparent(
                    name: pname.text,
                    Adress: pAddress.text,
                    dob: pDob.text,
                    AdmissionNo: pAdmissionNo.text,
                    phone: pPhone.text,
                  );
                  Get.back();
                },
                child: Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
