import 'package:flutter/material.dart';

class Checklist extends StatefulWidget {
  @override
  _ChecklistState createState() => _ChecklistState();
}

enum JourneyStatus { atPickup, onBus, nearDestination, arrived }

class TextDto {
  final String title;
  final String date;
  final String locationDetail;

  TextDto(this.title, this.date, this.locationDetail);
}

class _ChecklistState extends State<Checklist> {
  final List<String> users = [
    'Michael Wilson',
    'Vivienne Daniel',
    'Alexander Johnson',
    'Emma Thompson',
    'Jonah Stephens',
    'Julia Salazar',
    'Rowan Briggs',
    'Christopher White',
    'Olivia Lopez',
    'Joshua Martin',
    'Sophia Lee',
  ];

  Map<String, JourneyStatus> userJourneyStatus = {};
  Map<String, List<TextDto>> userJourneyDetails = {};

  @override
  void initState() {
    super.initState();
    for (var user in users) {
      userJourneyStatus[user] = JourneyStatus.atPickup;
      userJourneyDetails[user] = [
        TextDto("At Pickup Point", "Starting Point", "Location: Pickup Point")
      ];
    }
  }

  void _showJourneyDetails(String user) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView(
                shrinkWrap: true,
                children: userJourneyDetails[user]!
                    .map((detail) => ListTile(
                          title: Text("${detail.title} - ${detail.date}"),
                          subtitle: Text(detail.locationDetail),
                        ))
                    .toList(),
              ),
              if (userJourneyStatus[user] != JourneyStatus.arrived)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      String locationDetail = "Location Detail Not Available";

                      switch (userJourneyStatus[user]) {
                        case JourneyStatus.atPickup:
                          userJourneyStatus[user] = JourneyStatus.onBus;
                          locationDetail = "Location: En Route";
                          break;
                        case JourneyStatus.onBus:
                          userJourneyStatus[user] =
                              JourneyStatus.nearDestination;
                          locationDetail = "Location: Near Destination";
                          break;
                        case JourneyStatus.nearDestination:
                          userJourneyStatus[user] = JourneyStatus.arrived;
                          locationDetail = "Location: Destination";
                          break;
                        default:
                          break;
                      }
                      userJourneyDetails[user]!
                          .add(TextDto("Stage Changed", "Now", locationDetail));
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Next Stage'),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Checklist"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(users[index]),
                onTap: () => _showJourneyDetails(users[index]),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
