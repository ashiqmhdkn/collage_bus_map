import 'package:collage_bus_nufa/parent.dart';
import 'package:collage_bus_nufa/restart.dart';
import 'package:collage_bus_nufa/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class admin extends StatefulWidget {
  const admin({super.key});

  @override
  State<admin> createState() => adminstate();
}

class adminstate extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard('Student Details',CupertinoIcons.add,Colors.deepOrange,parent()),
                  itemDashboard('Teacher Details', CupertinoIcons.person_2, Colors.green,student()),
                  itemDashboard('Restart', CupertinoIcons.restart, Colors.green,restart()),
                  itemDashboard('feedback', CupertinoIcons.rectangle_stack_person_crop_fill, Colors.green,parent()),
                 ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
Widget itemDashboard(String title, IconData iconData, Color background, Widget push) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: InkWell(
      onTap: () {
Get.to(push);
      },
      borderRadius: BorderRadius.circular(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
            ),
            child: Icon(
              iconData,
              color: Colors.white,
              size: 67,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
