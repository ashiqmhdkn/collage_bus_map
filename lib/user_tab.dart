import 'package:collage_bus_nufa/home.dart';
import 'package:collage_bus_nufa/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class user_tab extends StatelessWidget {
  user_tab({super.key});

  RxInt currentPageIndex = 1.obs;
  changePageIndex(int index) {
    currentPageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp),
                label: "Profile",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
            ],
            currentIndex: currentPageIndex.value,
            selectedLabelStyle: TextStyle(color: Colors.black),
            unselectedLabelStyle: TextStyle(color: Colors.transparent),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              changePageIndex(index);
            },
          ),
        ),
        body: Obx(() {
          return IndexedStack(
            index: currentPageIndex.value,
            children: [
              Settings(showEditProfile: true),
              Home(),
            ],
          );
        }),
      ),
    );
  }
}
