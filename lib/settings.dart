import 'package:collage_bus_nufa/updateusers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';
import 'feedback_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late ImagePicker _imagePicker;
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: _imageFile != null
                  ? DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: FileImage(File(_imageFile!.path)),
                    )
                  : null,
            ),
            child: _imageFile != null
                ? IconButton(
                    // Child widget when no image is selected
                    icon: Icon(Icons.ac_unit_outlined),
                    onPressed: _pickImage,
                  )
                // Child widget when an image is selected
                : IconButton(
                    // Child widget when no image is selected
                    icon: Icon(Icons.add_a_photo),
                    onPressed: _pickImage,
                  ),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Edit Profile"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.to(update_parent());
            },
          ),
          ListTile(
            leading: Icon(Icons.feed),
            title: Text("Privacy Policy"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              _showPrivacyPolicyDialog(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.error),
            title: Text("About"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              _showAboutAppDialog(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Get.defaultDialog(
                title: "Logout",
                middleText: "Are you sure you want to logout?",
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back(); // Close the dialog
                    },
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () async {
                      // Clear user session
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      await sp.clear();
                      // Navigate back to the login screen
                      Get.offAll(() => Login());
                    },
                    child: Text("Logout"),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void _showPrivacyPolicyDialog(BuildContext context) {
    // Privacy policy dialog implementation remains unchanged.
  }

  void _showAboutAppDialog(BuildContext context) {
    // About app dialog implementation remains unchanged.
  }
}
