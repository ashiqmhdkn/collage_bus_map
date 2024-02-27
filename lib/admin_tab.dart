import 'package:collage_bus_nufa/admin.dart';
import 'package:collage_bus_nufa/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings.dart';

class admin_tab extends StatelessWidget {
  admin_tab({super.key});

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
                icon: Icon(Icons.admin_panel_settings_outlined),
                label: "Admin",
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
        //  NavigationBar(
        //   destinations: [
        //     NavigationDestination(
        //       icon: Icon(Icons.account_circle_sharp),
        //       label: "Profile",
        //     ),
        //     NavigationDestination(
        //       icon: Icon(Icons.admin_panel_settings_outlined),
        //       label: "Admin",
        //     )
        //   ],
        //   selectedIndex: currentPageIndex.value,
        //   onDestinationSelected: (int index) {
        //       currentPageIndex = index as RxInt;
        //   },
        //   labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        // ),
        body: Obx(() {
          return IndexedStack(
            index: currentPageIndex.value,
            children: [
              Settings(),
              Admin(),
            ],
          );
        }),
      ),
    );
  }
}

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
                icon: Icon(Icons.admin_panel_settings_outlined),
                label: "Admin",
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
        //  NavigationBar(
        //   destinations: [
        //     NavigationDestination(
        //       icon: Icon(Icons.account_circle_sharp),
        //       label: "Profile",
        //     ),
        //     NavigationDestination(
        //       icon: Icon(Icons.admin_panel_settings_outlined),
        //       label: "Admin",
        //     )
        //   ],
        //   selectedIndex: currentPageIndex.value,
        //   onDestinationSelected: (int index) {
        //       currentPageIndex = index as RxInt;
        //   },
        //   labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        // ),
        body: Obx(() {
          return IndexedStack(
            index: currentPageIndex.value,
            children: [
              Settings(),
              Home(),
            ],
          );
        }),
      ),
    );
    ;
  }
}
