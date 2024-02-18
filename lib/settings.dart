import 'package:collage_bus_nufa/controllers/models/serivices.dart';
import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feedback_page.dart';

class Settings extends StatelessWidget {
  Settings({Key? key});
  final UserController _user = UserController();
  late final List<user> users;
  data() async {
    // Get all users
    users = await _user.getUsers();
    // Do something with the retrieved users, e.g., display in a list
    print(users);
  }

  @override
  Widget build(BuildContext context) {
    data();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(7),
              child: CircleAvatar(
                radius: 37,
                child: Image.asset("assets\images\buspreview.jpg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () async {
                await _user.createUser(
                  user(
                    name: 'John Doe',
                    email: 'john@example.com',
                    phone: 1234567890,
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.feed),
              title: Text("Privacy Policy"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                print(users[0].name);
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
                showDialog(
                  context: context,
                  builder: (cntx) => AlertDialog(
                    title: Text("Logout"),
                    content: Text("Do you want to Logout?"),
                    actions: [
                      ElevatedButton(
                        onPressed: () async {
                          SharedPreferences sp =
                              await SharedPreferences.getInstance();
                          sp.setBool('log', false);
                          sp.setString("Id", "");
                          sp.setString("Pass", '');
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Login()),
                              (Route<dynamic> route) => false);
                        },
                        child: Text("LOGOUT"),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(cntx);
                          },
                          child: Text("Cancel"))
                    ],
                  ),
                );
              },
            ),
          ],
        ),
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
                  "Collage Bus Nufa is a dedicated application to facilitate communication and coordination related to school bus transportation. It provides features such as checklists, payment tracking, and quick messaging to enhance the overall experience for parents, teachers, and staff involved in the school bus system.",
                ),
                SizedBox(height: 8),
                Text(
                  "Developer:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "",
                ),
                SizedBox(height: 8),
                Text(
                  "Contact:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "[Your Contact Information]",
                ),
                SizedBox(height: 8),
                Text(
                  "Website:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "[Your Website, if applicable]",
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
