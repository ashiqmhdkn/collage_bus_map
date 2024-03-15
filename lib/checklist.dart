import 'package:collage_bus_nufa/bottom.dart';
import 'package:collage_bus_nufa/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:collage_bus_nufa/controllers/usercontrol.dart';

class Checklist extends StatefulWidget {
  @override
  State<Checklist> createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  final UserController userController = Get.put(UserController());

  // Initialize UserController
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: _isSearching ? _buildSearchAppBar() : _buildRegularAppBar(),
        ),
      ), 
      body: Obx(() {
        // Use Obx here to listen to changes in UserController
        if (userController.isLoading.isTrue) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              User user = userController.users[index];
              return Column(
                children: [
                  ListTile(
                    title: Text(user.name ?? "Unknown"),
                    subtitle: Text("Admission No: ${user.admissionNo}"),
                    onTap: () {
                      Get.bottomSheet(
                        bottom(user: user),
                      );
                    },
                  ),
                  const Divider(),
                ],
              );
            },
          );
        }
      }),
    );
  }
  AppBar _buildRegularAppBar() {
    return AppBar(
      title: Text('CheckList'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            setState(() {
              _isSearching = true;
            });
          },
        ),
      ],
    );
  }

  AppBar _buildSearchAppBar() {
    return AppBar(
      title: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
        ),
        autofocus: true,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          // Perform search action here
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            setState(() {
              _isSearching = false;
              _searchController.clear();
            });
          },
        ),
      ],
    );
  }
}


