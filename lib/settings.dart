import 'package:collage_bus_nufa/controllers/models/serivices.dart';
import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'feedback_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

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
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage("assets/images/profile.jpg"),
              ),
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
