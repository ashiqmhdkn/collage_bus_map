import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      {"name": "John Doe (Driver)", "phone": "1234567890"},
      // Add other persons here...
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Quick Messages & Calls"),
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
      trailing: Row(
        mainAxisSize: MainAxisSize.min, // Add this line to keep icons together
        children: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () => _sendSMS(person["phone"]!, context),
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () => _makePhoneCall(person["phone"]!, context),
          ),
        ],
      ),
    );
  }

  Future<void> _sendSMS(String phoneNumber, BuildContext context) async {
    final Uri launchUri = Uri.parse("sms:$phoneNumber");
    if (!await launchUrl(launchUri)) {
      _showErrorDialog(context, 'Could not launch $launchUri');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber, BuildContext context) async {
    final Uri launchUri = Uri.parse("tel:$phoneNumber");
    if (!await launchUrl(launchUri)) {
      _showErrorDialog(context, 'Could not launch $launchUri');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
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
