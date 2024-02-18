import 'package:collage_bus_nufa/locationmap.dart';

import 'package:flutter/material.dart';

// Import the MessagePage
import 'message_page.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    //  CollectionReference users =
    //   FirebaseFireStore.instance.collection('users');
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 10,
              child: LocationMap(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  // Use GestureDetector to make ListTile clickable
                  GestureDetector(
                    onTap: () {
                      // Navigate to MessagePage when ListTile is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MessagePage()),
                      );
                    },
                    child: ListTile(
                      title: Text("Quick Message"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
