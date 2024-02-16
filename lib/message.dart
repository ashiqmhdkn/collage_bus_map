import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class message extends StatelessWidget {
  String name;
  message({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
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
                  decoration: InputDecoration(
                    labelText: 'type any message',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
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
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('message deliverd')),
                    );
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