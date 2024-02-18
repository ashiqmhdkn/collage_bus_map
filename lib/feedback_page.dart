import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Make sure this import is added

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  String feedback = '';

  String? getUsername() {
    final user = FirebaseAuth.instance.currentUser;
    return user
        ?.displayName; // Assumes the username is stored in the displayName field
  }

  // Method to submit feedback to Firestore
  Future<void> submitFeedback(String feedback, String? username) async {
    // Reference to Firestore collection
    CollectionReference feedbacks =
        FirebaseFirestore.instance.collection('feedbacks');

    // Call Firestore to add new feedback document
    return feedbacks
        .add({
          'feedback': feedback, // Your feedback field
          'timestamp': FieldValue
              .serverTimestamp(), // Adds server timestamp for when the feedback was submitted
          'username': username ??
              'Anonymous', // Use username if available, otherwise 'Anonymous'
        })
        .then((value) => print("Feedback Added"))
        .catchError((error) => print("Failed to add feedback: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Your Feedback',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
                onSaved: (value) {
                  feedback = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    String? username = getUsername();
                    submitFeedback(feedback, username).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Feedback submitted')),
                      );
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to submit feedback')),
                      );
                    });
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
