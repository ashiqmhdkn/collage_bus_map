import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collage_bus_nufa/parent.dart';
import 'package:collage_bus_nufa/restart.dart';
import 'package:collage_bus_nufa/show_feedback.dart';
import 'package:collage_bus_nufa/student.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    // Getting screen size
    var size = MediaQuery.of(context).size;

    // Adjusting the child aspect ratio based on screen size
    double aspectRatio = size.width / (size.height / 1.5);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: size.width > 600 ? 4 : 2, // Number of columns
          crossAxisSpacing: 10, // Horizontal space between cards
          mainAxisSpacing: 80, // Vertical space between cards
          childAspectRatio: aspectRatio, // Adjust based on your content
          children: <Widget>[
            itemDashboard('Student Details', CupertinoIcons.person_2,
                Colors.deepOrange, parent()),
            itemDashboard('Teacher Details', CupertinoIcons.person_3,
                Colors.green, student()),
            itemDashboard(
                'Restart', CupertinoIcons.restart, Colors.blue, restart()),
            itemDashboard('Feedback', CupertinoIcons.mail, Colors.purple,
                show_feedback()),
          ],
        ),
      ),
    );
  }

  Widget itemDashboard(
      String title, IconData iconData, Color background, Widget push) {
    return GestureDetector(
      onTap: () {
        Get.to(() => push);
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: Colors.white,
                size: 50,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
