import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:collage_bus_nufa/controllers/usercontrol.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class student extends StatelessWidget {
  student({super.key});
  UserController usersc = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          title: Text("Teacher"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => add_student()));
          },
          child: Icon(Icons.add),
          backgroundColor: const Color.fromARGB(255, 83, 160, 223),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          tooltip: "Add a Teacher",
        ),
        body: Obx(() {
          if (usersc.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: usersc.users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(usersc.users[index].name!),
                  subtitle:
                      Text(usersc.users[index].password ?? 'notavailable'),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
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

class add_student extends StatelessWidget {
  add_student({super.key});
  RxBool showpassword = true.obs;
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  UserController usersc = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    Future<void> addstaff(
        {String? name,
        String? Adress,
        String? dob,
        String? phone,
        String? AdmissionNo}) async {
      await usersc.createUser(User(
        name: name,
        address: Adress,
        password: dob,
        usertype: AdmissionNo,
        phone: phone,
      ));
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add teacher"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text("Name of Teacher"),
                  border: OutlineInputBorder(),
                ),
                controller: _name,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _phone,
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
              Padding(
                padding: EdgeInsets.all(5),
                child: Obx(() {
                  return TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x51B78403)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFFC122)),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          showpassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          // Toggle the value of showpassword when IconButton is pressed
                          showpassword.toggle();
                        },
                      ),
                    ),
                    obscureText: !showpassword.value,
                    controller: _password,
                    style: TextStyle(color: Colors.grey[800]),
                    // Darker text color
                  );
                }),
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
                  await addstaff(
                      name: _name.text,
                      phone: _phone.text,
                      dob: _password.text,
                      AdmissionNo: 'teacher');
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
