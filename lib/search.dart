import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class search extends StatelessWidget {
//   const search({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController search = TextEditingController();
//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(
//         title: Text("searchbar"),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             CupertinoTextField(
//               controller: search,
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }
// class CustomSearchDelegate extends SearchDelegate<String> {

//   @override
// Widget buildResults(BuildContext context) {
//   return StreamBuilder(
//     stream: FirebaseFirestore.instance
//         .collection('your_collection') // Replace 'your_collection' with your collection name
//         .where('search_key', isEqualTo: query) // Assume 'search_key' is the field you want to search
//         .snapshots(),
//     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//       if (!snapshot.hasData) {
//         return Center(child: CircularProgressIndicator());
//       }

//       final results = snapshot.data.docs;

//       return ListView(
//         children: results.map<Widget>((doc) => ListTile(
//           title: Text(doc['name']), // Assume you want to show the 'name' field
//           subtitle: Text(doc['description']), // And maybe a 'description'
//           onTap: () {
//             // Handle the tap if needed
//           },
//         )).toList(),
//       );
//     },
//   );
// }

 
//   @override
//   List<Widget> buildActions(BuildContext context) { 
//     // Build the clear button.
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     // Build the leading icon.
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // Build the search results.
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {

//     // Build the search suggestions.
//   }
// }