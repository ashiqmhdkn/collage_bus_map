import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:collage_bus_nufa/controllers/usercontrol.dart';
import 'package:collage_bus_nufa/teafee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class payment extends StatefulWidget {
  payment({super.key});

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  UserController _userController = Get.put(UserController());

  bool _isSearching = false;

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: _isSearching ? _buildSearchAppBar() : _buildRegularAppBar(),
        ),
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
  AppBar _buildRegularAppBar() {
    return AppBar(
      title: Text('Students'),
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
 