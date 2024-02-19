import 'dart:io';

import 'package:collage_bus_nufa/controllers/models/serivices.dart';
import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'feedback_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}


class _SettingsState extends State<Settings> {
  late  ImagePicker _imagePicker;
   XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    
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
                ? IconButton( // Child widget when no image is selected
                      icon:Icon(Icons.ac_unit_outlined),
                      onPressed: _pickImage,
                      )
      // Child widget when an image is selected
                : IconButton( // Child widget when no image is selected
                      icon: Icon(Icons.add_a_photo),
                      onPressed: _pickImage,
    ),
            
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
            trailing: Icon(Icons.arrow_forward_ios),
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
            leading: Icon(Icons.feedback),
            title: Text("Feedback"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FeedbackPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              _showLogoutDialog(context);
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

  void _showLogoutDialog(BuildContext context) {
    // Logout dialog implementation remains unchanged.
  }
}
