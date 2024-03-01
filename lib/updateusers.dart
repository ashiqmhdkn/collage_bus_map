import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:collage_bus_nufa/parent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class update_parent extends StatelessWidget {
    User user;
  update_parent( this.user);
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
    userController.updateUser(
        user.name!,
        User(
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
          title: Text("Student"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              TextField(
                controller: pname,
                decoration: InputDecoration(
                  label: Text(user.name??''),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: pAdmissionNo,
                decoration: InputDecoration(
                  label: Text(user.admissionNo??''),
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
                  label: Text(user.phone??''),
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
                label: Text(user.address??''),
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
                 label: Text(user.password??''),
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
                child: Text("update"),
              )
            ],
          ),
        ),
      ),
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
    userController.createUser(User(
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
          title: Text("Student"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              TextField(
                controller: pname,
                decoration: InputDecoration(
                  label: Text("Name of Student"),
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

