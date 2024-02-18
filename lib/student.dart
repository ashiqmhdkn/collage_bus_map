import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class student extends StatefulWidget {
  const student({super.key});

  @override
  State<student> createState() => studentState();
}

class studentState extends State<student> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          appBar: AppBar(
            title: Text("Student"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => add_student()));
            },
            child: Icon(Icons.add),
            backgroundColor: const Color.fromARGB(255, 83, 160, 223),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            tooltip: "Add a Student",
          ),
          body: ListView(
            children: [],
          )),
    );
  }
}

class add_student extends StatefulWidget {
  const add_student({super.key});

  @override
  State<add_student> createState() => _add_studentState();
}

class _add_studentState extends State<add_student> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Student"),

        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                
                decoration: InputDecoration(
                  label: Text("Name of Student"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text("Register Number"),
                  border: OutlineInputBorder(),
                ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
              ),
               SizedBox(
                height: 10,
              ),

              TextField(
                decoration: InputDecoration(
                  label: Text("Date OF birth"),
                  border: OutlineInputBorder(),
                ),
                keyboardType:TextInputType.datetime,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
