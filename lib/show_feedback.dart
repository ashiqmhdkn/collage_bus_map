import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class show_feedback extends StatelessWidget {
   show_feedback({super.key});

  final feedbacks = [
    'Simplify the user interface to make it intuitive for users of all technical levels.',
    'Simplify the user interface to make it intuitive for users of all technical levels.Simplify the user interface to make it intuitive for users of all technical levels.',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Feedback"),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
            return  Expanded(
                child: Card(
                 child: Column(
                  children: [ 
                    Card(
                      child: TextButton(onPressed: (){}, child: Text("Hello Wolrd"),style: ButtonStyle(),),
                    )
                  ],
                 ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
            itemCount: 10),
      ),
    );
  }
}
