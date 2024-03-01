import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:collage_bus_nufa/controllers/usercontrol.dart';
import 'package:collage_bus_nufa/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class payment extends StatelessWidget {
  payment({super.key});

  UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              "Students",
              style: TextStyle(fontSize: 20),
            ),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ),
          automaticallyImplyLeading: false,
        ),
        body:Obx(() {
        // Use Obx here to listen to changes in UserController
        if (_userController.isLoading.isTrue) {
          return Center(child: CircularProgressIndicator());
        } else {
          return  ListView.builder(
          itemCount: _userController.users.length,
          itemBuilder: (context, index) {
            User user = _userController.users[index];
            return Column(
              children: [
                ListTile(
                  title: Text(user.name??'unknown'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => message(name: user.name??'unknow'),
                      ),
                    );
                  },
                ),
                const Divider(),
              ],
            );
          },
        );}}
      ),
     ),
      );
  }
}
