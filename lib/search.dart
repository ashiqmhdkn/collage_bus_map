import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("searchbar"),),
        body: Container(
          child: Column(
            children: [
              CupertinoTextField()
            ],
          ),
        ),
      )
    );
  }
}
