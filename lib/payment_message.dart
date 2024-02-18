import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

List<ChatMessage> messages = [
  ChatMessage(
      messageContent:
          "Hey [Parent's Name], just a friendly reminder about the pending payment we discussed. Please let me know if there are any questions or concerns. Thanks!",
      messageType: "message"),
  ChatMessage(messageContent: "2000", messageType: "amount")
];

class payment_message extends StatelessWidget {
  const payment_message({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chatbox"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: messages.map((message) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: message.messageType == "message"
                        ? Colors.grey.shade200
                        : Colors.blue[200],
                  ),
                  child: Text(
                    message.messageContent,
                    style: TextStyle(fontSize: 15),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
