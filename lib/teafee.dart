import 'package:collage_bus_nufa/controllers/messagecon.dart';
import 'package:collage_bus_nufa/controllers/models/feedbackmodel.dart';
import 'package:collage_bus_nufa/controllers/usercontrol.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class message extends StatelessWidget {
  String name;
  message({super.key, required this.name});

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    TextEditingController paymentController = TextEditingController();
    final FeedbackController fdcon = Get.put(FeedbackController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(3)),
                TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(
                    labelText: 'type any message',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: paymentController,
                  decoration: InputDecoration(
                      labelText: "Due Payment",
                      border: OutlineInputBorder(),
                      hintText: "Enter the amount",
                      prefixIcon: Icon(Icons.currency_rupee)),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Send'),
                  ),
                  onPressed: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    String sent = sp.getString('Id') ?? '';
                    fdcon.submitFeedback(feedback(
                        senderId: sent,
                        receiverId: name,
                        content: messageController.text,
                        fee: paymentController.text));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('message deliverd')),
                    );
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
