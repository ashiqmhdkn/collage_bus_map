import 'package:flutter/material.dart';
import 'apar.dart'; // Ensure this import points to your actual navigation target.
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  Login();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _userId = TextEditingController();
  TextEditingController _password = TextEditingController();

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
                image: AssetImage("assets/images/login.jpg"),
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
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x51B78403)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFC122)),
                          ),
                        ),
                        obscureText: true,
                        controller: _password,
                        style: TextStyle(
                            color: Colors.grey[800]), // Darker text color
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
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
    bool loginSuccess = false;
    if (_userId.text == "ashique" && _password.text == "123" ||
        _userId.text == "sreerag" && _password.text == "123" ||
        _userId.text == "nasif" && _password.text == "123") {
      sp.setString("Id", _userId.text);
      sp.setString("Pass", _password.text);
      sp.setBool('log', true);
      loginSuccess = true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid username or password"),
      ));
    }

    if (loginSuccess) {
      islogin();
    }
  }

  Future<void> islogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getBool('log') == true) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => apar())); // Ensure this navigation is correct
    }
  }
}
