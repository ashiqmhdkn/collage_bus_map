import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class parent extends StatefulWidget {
  const parent({super.key});

  @override
  State<parent> createState() => parentState();
}

class parentState extends State<parent> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          appBar: AppBar(
            title: Text("Parent"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => add_parent()));
            },
            child: Icon(Icons.add),
            backgroundColor: const Color.fromARGB(255, 83, 160, 223),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            tooltip: "Add a Parent",
          ),
          body: ListView(
            children: [],
          )),
    );
  }
}

class add_parent extends StatefulWidget {
  const add_parent({super.key});

  @override
  State<add_parent> createState() => add_parentState();
}

class add_parentState extends State<add_parent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Parent"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text("Name of Parent"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text("Phone Number"),
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
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  label: Text("Address",style: TextStyle(),),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.streetAddress,
                maxLines: 3,
                
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text("Date of birth"),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
               SizedBox(
                height: 10,
              ),
              ElevatedButton(
                    style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.only(
                        left: 150,
                        right: 150,
                        top: 10,
                        bottom: 10,
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(
                      TextStyle(
                        fontSize: 20,
                      ),
                    ),),
                    onPressed: () {},
                    child: Text("Add"),
              )
            ],
          ),
        ),
      ),
    );;
  }
}