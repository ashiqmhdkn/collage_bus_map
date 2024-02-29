// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collage_bus_nufa/data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collage_bus_nufa/parent.dart';
import 'package:collage_bus_nufa/student.dart';

class Admin extends StatelessWidget {
  Admin({Key? key}) : super(key: key);

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
            GestureDetector(
                child: itemDashboard(
                    background: Colors.deepOrange,
                    iconData: CupertinoIcons.person_2,
                    title: 'Student Details'),
                onTap: () {
                  Get.to(parent());
                }),
            GestureDetector(
                child: itemDashboard(
                    background: Colors.green,
                    iconData: CupertinoIcons.person_3,
                    title: 'Teacher Details'),
                onTap: () {
                  Get.to(student());
                }),
            // GestureDetector(
            //     child: itemDashboard(
            //         background: Colors.blue,
            //         iconData: CupertinoIcons.restart,
            //         title: 'Restart'),
            //     onTap: () {
            //       restartApp();
            //     }),
           
            GestureDetector(
                child: itemDashboard(
                    background: Colors.yellow,
                    iconData: CupertinoIcons.table,
                    title: 'Attendence'),
                onTap: () {
                  Get.to(AttendanceTable ());
                }),
          ],
        ),
      ),
    );
  }
}

restartApp() {
  Get.defaultDialog(
      title: 'Notification', // To display the title it is optional
      content: Text('Restarted'), // Message which will be pop up on the screen
      // Action widget which will provide the user to acknowledge the choice
      actions: [
        TextButton(
          // FlatButton widget is used to make a text to work like a button
          onPressed: () {
            Get.back();
          }, // function used to perform after pressing the button
          child: Text('Ok'),
        ),
      ]);
}

class itemDashboard extends StatelessWidget {
  itemDashboard({
    Key? key,
    required this.title,
    required this.background,
    required this.iconData,
  }) : super(key: key);

  final String title;
  final Color background;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
