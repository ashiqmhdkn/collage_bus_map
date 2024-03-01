import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:collage_bus_nufa/controllers/table_countroller.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:get/get.dart';
import 'package:collage_bus_nufa/controllers/usercontrol.dart';

class AttendanceTable extends StatefulWidget {
  AttendanceTable({Key? key}) : super(key: key);

  @override
  State<AttendanceTable> createState() => _AttendanceTableState();
}

class _AttendanceTableState extends State<AttendanceTable> {
  // Initialize UserController
  final UserController usersc = Get.put(UserController());

  final TableController table = Get.put(TableController());
  @override
  void initState() {
    delay();
    table.addColumnData();
    table.convertTOList();

    super.initState();
  }

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
          rows:
              // [],
              _buildRows(),
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

    table.listColumnData.isEmpty
        ? DataColumn(label: Text("empty"))
        : table.listColumnData.forEach((element) {
            columns.add(DataColumn(label: Text(element)));
          });

    return columns;
  }

  List<DataRow> _buildRows() {
    List<DataRow> rows = [];

    // Generate rows for each user
    usersc.users.forEach((user) async {
      List<Journey> journy1List = table.addRowsData(user);

      String userName = user.name!;
      List<DataCell> cells = [
        DataCell(Text(userName)),
        DataCell(
          Column(
            children: [
              Text("M"),
              Text("E"),
            ],
          ),
        ),
      ];
      for (int i = 0; i < table.listColumnData.length; i++) {
        if (journy1List.length > i) {
          bool entry = journy1List[i].entry ?? false;
          bool exit = journy1List[i].exit ?? false;
          cells.add(DataCell(present(entry, exit)));
        } else {
          cells.add(DataCell(present(false, false)));
        }
      }

      rows.add(DataRow(cells: cells));
    });

    return rows;
  }

  Widget present(bool entry, bool exit) {
    return Column(
      children: [
        entry
            ? Icon(
                Icons.check,
                color: Colors.green,
              )
            : Icon(
                Icons.close,
                color: Colors.red,
              ),
        exit
            ? Icon(
                Icons.check,
                color: Colors.green,
              )
            : Icon(
                Icons.close,
                color: Colors.red,
              ),
      ],
    );
  }

  delay() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
