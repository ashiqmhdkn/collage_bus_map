import 'package:collage_bus_nufa/controllers/messagecon.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class payment_message extends StatelessWidget {
  String sent, reciver;
  payment_message({required this.reciver, required this.sent, Key? key});
  final FeedbackController fdcon = Get.put(FeedbackController());
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(fdcon.feedbackList);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(reciver),
        ),
        body: Container( // Add Container with fixed height
          height: MediaQuery.of(context).size.height, // Adjust the height as needed
          child: SingleChildScrollView(
            child: ListView.builder(
              itemCount: fdcon.feedbackList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: fdcon.feedbackList[index].fee == "message"
                        ? Colors.grey.shade200
                        : Colors.blue[200],
                  ),
                  child: ListTile(
                    leading: Text(
                      fdcon.feedbackList[index].fee ?? '',
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(fdcon.feedbackList[index].content ?? ''),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
