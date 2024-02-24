import 'package:collage_bus_nufa/parent.dart';
import 'package:collage_bus_nufa/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        backgroundColor: Colors.amberAccent,
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
                crossAxisCount: 1,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard('Parent Details',CupertinoIcons.add,Colors.deepOrange,),
                  itemDashboard('Student Details', CupertinoIcons.person_2, Colors.green),
                 ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
itemDashboard(String title, IconData iconData, Color background) => TextButton(
        onPressed: () {
          if(iconData==CupertinoIcons.add){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => parent(),
            ),
          );
          }
          else{
             Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => student(),
            )
          );
          }
        },
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
            SizedBox(
              height: 4,
            ),
            Text(title.toUpperCase(),
                style: Theme.of(context).textTheme.titleSmall)
          ],
        ),
      );
}
