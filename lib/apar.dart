import 'package:collage_bus_nufa/checklist.dart';
import 'package:collage_bus_nufa/payment.dart';
import 'package:flutter/material.dart';
import 'settings.dart';
import 'home.dart';

class apar extends StatefulWidget {
  const apar({super.key});

  @override
  State<apar> createState() => _aparState();
}

class _aparState extends State<apar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
              icon: Icon(Icons.check_box), label: "Checklist"),
          NavigationDestination(
            icon: Icon(Icons.payment),
            label: "Payment",
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_sharp),
            label: "Profile",
          ),
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
      body: [
        Home(),
        Checklist(),
        payment(),
        Settings(),
      ][currentPageIndex],
    ));
  }
}
