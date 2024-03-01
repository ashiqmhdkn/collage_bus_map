import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class show_feedback extends StatefulWidget {
  @override
  _show_feedbackState createState() => _show_feedbackState();
}

class _show_feedbackState extends State<show_feedback> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('user.name'),
        ),
        body: StreamBuilder(
          stream: _firestore
              .collection('feedbacks')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot feedback = snapshot.data!.docs[index];
                return ListTile(
                  title: Text(feedback['feedback']),
                  subtitle: Text(feedback['username']),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
