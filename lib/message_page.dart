import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:collage_bus_nufa/controllers/usercontrol.dart';
import 'package:collage_bus_nufa/parent.dart';
import 'package:collage_bus_nufa/show_feedback.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Messages',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MessagePage(),
    );
  }
}

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Quick Messages"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (User person in userController.teachers)
              buildProfileTile(person, context),
          ],
        ),
      ),
    );
  }

  ListTile buildProfileTile(User person, BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(person.name!),
      subtitle: Text("Phone: ${person.phone}"),
      trailing: IconButton(
        icon: Icon(Icons.message),
        onPressed: () => Get.to(show_feedback()),
      ),
    );
  }
}
