import 'package:collage_bus_nufa/controllers/messagecon.dart';
import 'package:collage_bus_nufa/controllers/models/feedbackmodel.dart';
import 'package:collage_bus_nufa/controllers/usercontrol.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePage extends StatelessWidget {
  MessagePage({super.key, required this.currentUser});
  final String currentUser;

  final UserController userController = Get.put(UserController());

  final FeedbackController msg = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: msg.feedbackList.isEmpty
          ? Center(
              child: SizedBox(
                child: Text("No messages Available"),
              ),
            )
          : ListView.builder(
              itemCount: msg.feedbackList.length,
              itemBuilder: (BuildContext, index) {
                return buildProfileTile(msg.feedbackList[index]);
              }),
    );
  }

  buildProfileTile(feedback feedbackList) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blueGrey)),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text(feedbackList.senderId!,
                  style: TextStyle(color: Colors.blue)),
              trailing: Icon(Icons.message),
            ),
            Text(feedbackList.content!),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.currency_rupee,
                  color: Colors.red,
                  size: 15,
                ),
                Text(
                  feedbackList.fee!,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
