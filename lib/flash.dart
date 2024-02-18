import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Flash extends StatefulWidget {
  const Flash({super.key});

  @override
  State<Flash> createState() => _FlashState();
}

Future<void> dispose() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class _FlashState extends State<Flash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // Use the entire screen's width and height
          width: double.infinity,
          height: double.infinity,
          child: Image(
            image: AssetImage("assets/images/flash.png"),
            // Make the image cover the entire container
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
