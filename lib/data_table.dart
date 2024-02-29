import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:get/get.dart';
import 'package:collage_bus_nufa/controllers/models/usercontrol.dart';

class AttendanceTable extends StatelessWidget {
  AttendanceTable({Key? key}) : super(key: key);

  // Initialize UserController
  final UserController usersc = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Attendance Table")),
      body: SafeArea(
        child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: _buildColumns(),
          rows: _buildRows(),
        ),
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    List<DataColumn> columns = [
      DataColumn(
        label: Text(
          "Student",
          style: TextStyle(color: Color.fromARGB(255, 15, 5, 73)),
        ),
      ),
      DataColumn(
        label: Text(
          "Time",
          style: TextStyle(color: Color.fromARGB(255, 15, 5, 73)),
        ),
      ),
    ];

    // Add date columns dynamically
    usersc.users.forEach((user) {
      user.journeys?.forEach((journey) {
        String date = journey.date ?? "Date not available";
        columns.add(
          DataColumn(
            label: Text(
              date,
              style: TextStyle(color: Color.fromARGB(255, 15, 5, 73)),
            ),
          ),
        );
      });
    });

    return columns;
  }

 List<DataRow> _buildRows() {
  List<DataRow> rows = [];

  // Generate rows for each user
  usersc.users.forEach((user) {
    String userName = user.name !;

    user.journeys!.forEach((journey) {
      List<DataCell> cells = [
        DataCell(Text(userName)),
        DataCell(Column(
          children: [
            Text("M"),
            Text("E"),
          ],
        )),
      ];

      // Add attendance data cells for this journey
      String date = journey.date ?? "Date not available";
      cells.add(DataCell(Text(date)));

      bool entry = journey.entry ?? false;
      bool exit = journey.exit ?? false;
      cells.add(DataCell(present(entry, exit)));

      rows.add(DataRow(cells: cells));
    });
  });

  return rows;
}


  Widget present(bool entry, bool exit) {
    return entry && !exit
        ? Icon(
            Icons.check,
            color: Colors.green,
          )
        : Icon(
            Icons.close,
            color: Colors.red,
          );
  }
}
