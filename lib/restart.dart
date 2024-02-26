import 'package:flutter/material.dart';
import 'package:get/get.dart';

class restart extends StatefulWidget {
  const restart ({super.key});

  @override
  State<restart> createState() => _restartState();
}

class _restartState extends State<restart> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
			title: Text('Notification'),		 // To display the title it is optional
			content: Text('Restarted'), // Message which will be pop up on the screen
												// Action widget which will provide the user to acknowledge the choice
				actions: [
				TextButton(					 // FlatButton widget is used to make a text to work like a button
				onPressed: () {
          Get.back();
        },			 // function used to perform after pressing the button
				child: Text('Ok'),
				),
        ]
			);

}
}