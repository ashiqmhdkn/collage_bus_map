import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

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
            for (var person in persons) buildProfileTile(person),
          ],
        ),
      ),
    );
  }

  ListTile buildProfileTile(Map<String, String> person) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(person["name"]!),
      subtitle: Text("Phone: ${person["phone"]}"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {
              _makePhoneCall(person["phone"]!);

              // Call the person
              // Implement the call functionality here
              print("Calling ${person["name"]} : ${person["phone"]}");
            },
          ),
          IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                _sendSMS(person["phone"]!);
                // Message the person
                // Implement the message functionality here
                print("Messaging ${person["name"]} : ${person["phone"]}");
              }),
        ],
      ),
    );
  }
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  // if (await canLaunchUrl(launchUri)) {
    // await launchUrl(launchUri);
  // } else {
    // throw 'Could not launch $launchUri';
  // }
}

Future<void> _sendSMS(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'sms',
    path: phoneNumber,
  );
  // if (await canLaunchUrl(launchUri)) {
  //   await launchUrl(launchUri);
  // } else {
  //   throw 'Could not launch $launchUri';
  // }
}
