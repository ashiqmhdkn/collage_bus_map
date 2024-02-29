import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:collage_bus_nufa/parent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class bottom extends StatelessWidget {
  User user;
  bottom({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String date = DateFormat('yMd').format(now);
    RxString Time = DateFormat('H').format(now).obs;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Date: $date"),
                subtitle: Obx(() {
                  if (int.parse(Time.value) < 12) {
                    return Text("the morning enter");
                  } else {
                    return Text("the evening enter");
                  }
                }),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Cancel")),
                  ElevatedButton(
                      onPressed: () async {
                        if (int.parse(Time.value) < 12) {
                          await userController.updateUserJourney(
                            newJourney:
                                Journey(date: date, entry: true, exit: false),
                            userName: user.name,
                          );
                        } else {
                          await userController.updateUserJourney(
                            newJourney:
                                Journey(date: date, exit: true),
                            userName: user.name,
                          );
                        }
                        Get.back();
                      },
                      child: Text("InBus")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
