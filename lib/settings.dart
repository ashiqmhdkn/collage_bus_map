import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:collage_bus_nufa/parent.dart';
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
            onTap: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              String? usernam = sp.getString("Id");
               User? std = await userController.getUserByName(usernam??'');
              Get.to(update_parent(std!));
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
 showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Privacy Policy"),
          content: SingleChildScrollView(
            child: Text(
              """
              A privacy policy is a legal document that details how a website gathers, stores, shares, and sells data about its visitors. This data typically includes items such as a user's name, address, birthday, marital status, medical history, and consumer behavior.

The specific contents of a privacy policy document depend upon the laws in the legal jurisdiction in which your business operates. Most countries have their own set of guidelines regarding what information is eligible for collection, and how that information may be used. Privacy laws include GDPR, CCPA, CalOPPA, PIPEDA, Australia Privacy Act and many more.

When it comes to legal documents, it is best not to take chances. Fortunately, it's easy to get a free privacy policy in just a few minutes. All you have to do is fill up the blank spaces on the right and we will create help you create your own personalized privacy policy template for your business.
              """,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  void _showAboutAppDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("About Collage Bus"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Version: 1.0.0",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Description:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Collage Bus managment is a dedicated application to facilitate communication and coordination related to school bus transportation. It provides features such as checklists, payment tracking, and quick messaging to enhance the overall experience for parents, teachers, and staff involved in the school bus system.",
                ),
                SizedBox(height: 8),
                Text(
                  "Developer:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Nufa,Rinshad,Najih,",
                ),
                SizedBox(height: 8),
                Text(
                  "Contact:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "+91 95399 07555",
                ),
                SizedBox(height: 8),
                Text(
                  "Website:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "https:wa.me/919539907555",
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
