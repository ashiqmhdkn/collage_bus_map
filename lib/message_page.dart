import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Messages',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MessagePage(),
    );
  }
}

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Person details
    final List<Map<String, String>> persons = [
      {"name": "John Doe (Driver)", "phone": "123-456-7890"},
      {"name": "Jane Smith (Teacher)", "phone": "987-654-3210"},
      {"name": "William Defoe (Staff)", "phone": "183-986-7900"},
      {"name": "Adin Rose (School Leader)", "phone": "997-874-9876"},
      {"name": "Mary Johnson (Staff)", "phone": "456-789-0123"},
      {"name": "Robert Davis (Teacher)", "phone": "789-012-3456"},
      {"name": "Emma White (Teacher)", "phone": "567-890-1234"},
      {"name": "Christopher Black (Staff)", "phone": "234-567-8901"},
      {"name": "Sophia Lee (School Leader)", "phone": "890-123-4567"},
      {"name": "Matthew Clark (Driver)", "phone": "345-678-9012"},
      {"name": "Olivia Lopez (Teacher)", "phone": "901-234-5678"},
      {"name": "Joshua Martin (Staff)", "phone": "123-567-8904"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Quick Messages"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var person in persons) buildProfileTile(person, context),
          ],
        ),
      ),
    );
  }

  ListTile buildProfileTile(Map<String, String> person, BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(person["name"]!),
      subtitle: Text("Phone: ${person["phone"]}"),
      trailing: IconButton(
        icon: Icon(Icons.message),
        onPressed: () => _sendSMS(person["phone"]!, context),
      ),
    );
  }

  Future<void> _sendSMS(String phoneNumber, BuildContext context) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      _showErrorDialog(context);
    }
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text('Could not launch messaging app'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
