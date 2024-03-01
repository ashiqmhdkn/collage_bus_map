import 'package:collage_bus_nufa/admin_tab.dart';
import 'package:collage_bus_nufa/controllers/usercontrol.dart';
import 'package:collage_bus_nufa/user_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'apar.dart'; // Ensure this import points to your actual navigation target.
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  Login();

  TextEditingController _userId = TextEditingController();

  TextEditingController _password = TextEditingController();
  UserController usersc = Get.put(UserController());
  RxBool showpassword = true.obs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/loginpic.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 2
                                ..color = Colors.black, // Stroke color
                            ),
                          ),
                          // Solid text as fill.
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              color: Colors.white, // Fill color
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "User Name",
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x51B78403)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFC122)),
                          ),
                        ),
                        controller: _userId,
                        style: TextStyle(
                            color: Colors.grey[800]), // Darker text color
                      ),
                      SizedBox(height: 8),
                      Obx(() {
                        return TextField(
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x51B78403)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFC122)),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                showpassword.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Toggle the value of showpassword when IconButton is pressed
                                showpassword.toggle();
                              },
                            ),
                          ),
                          obscureText: !showpassword.value,
                          controller: _password,
                          style: TextStyle(color: Colors.grey[800]),
                          // Darker text color
                        );
                      }),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(240, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () async {
                          await _handleLogin();
                        },
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool userFound = false;
    for (var user in usersc.users) {
      if (user.name == _userId.text && user.password == _password.text) {
        sp.setString("Id", _userId.text);
        sp.setString("Pass", _password.text);
        sp.setBool('log', true);
        
        if (user.usertype == 'admin') {
          Get.offAll(admin_tab());
          sp.setBool('adm', true);
        }
        else if(user.usertype =='teacher'){
          Get.offAll(apar());
        } 
        else {
          Get.offAll(user_tab());
        }
      }
    }
    if (userFound!) {
      GetSnackBar(message: "Invalid username or password");
      print("not availablein db username or password");
    }
  }
}
