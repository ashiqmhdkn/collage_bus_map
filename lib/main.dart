import 'dart:async';
import 'package:collage_bus_nufa/admin_tab.dart';
import 'package:collage_bus_nufa/controllers/models/authController.dart';
import 'package:collage_bus_nufa/controllers/models/usercontrol.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flash.dart';
import 'login.dart';
import 'apar.dart'; // Ensure this is the correct import
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure plugins are initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(authController()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const InitialScreen(),

    );
  }
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
} 

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final UserController usercController = UserController();
    bool isLogin = sp.getBool('log') ?? false;
    bool admin = sp.getBool('adm') ?? false;

    // Delay added to simulate loading time for Flash screen
    await Future.delayed(const Duration(seconds: 1));

    if (isLogin) {
      if (admin) {
        Get.offAll(() => admin_tab());
      } else {
        Get.offAll(apar());
      }
    } else {
    Get.offAll( Login());
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show flash screen while determining next screen
    return const Flash();
  }
}
