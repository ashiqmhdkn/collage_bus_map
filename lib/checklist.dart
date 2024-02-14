import 'package:flutter/material.dart';

class Checklist extends StatefulWidget {
  @override
  _ChecklistState createState() => _ChecklistState();
}

enum JourneyStatus { atPickup, onBus, nearDestination, arrived }

class TextDto {
  final String title;
  final String date;

  TextDto(this.title, this.date);
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

  // Function to show user journey details
  void _showJourneyDetails(String user) {
    int _step = 0;
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return SizedBox(
            height: 500,
            child: Container(
              child: Stepper(
                controlsBuilder: (context, controller) {
                  return const SizedBox.shrink();
                },
                type: StepperType.horizontal,
                steps: const [
                  Step(
                    title: SizedBox.shrink(),
                    content: SizedBox.shrink(),
                  ),
                  Step(
                    title: SizedBox.shrink(),
                    content: SizedBox.shrink(),
                  ),
                  Step(
                    title: SizedBox.shrink(),
                    content: SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          );
        });
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
