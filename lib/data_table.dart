import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class attendenceTable extends StatefulWidget {
  const attendenceTable({super.key});

  @override
  State<attendenceTable> createState() => _attendenceTableState();
}

class _attendenceTableState extends State<attendenceTable> {
  List dates = [
    "Student",
    "01/02/24",
    "02/02/24",
    "03/02/24",
    "04/02/24",
    "05/02/24",
    "06/02/24"
  ];
  List<Map<String, bool>> student = [
    {
      "1": true,
      "2": true,
      "3": false,
      "4": false,
      "5": false,
      "6": false,
    },
    {
      "1": false,
      "2": true,
      "3": true,
      "4": false,
      "5": false,
      "6": false,
    },
    {
      "1": true,
      "2": true,
      "3": false,
      "4": false,
      "5": false,
      "6": false,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,

          //  DataTable(
          //     columnSpacing: 20,
          //     showBottomBorder: true,
          //     border: TableBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          columns: dates
              .map((e) => DataColumn(
                      label: Text(
                    e,
                    style: TextStyle(color: Color.fromARGB(255, 15, 5, 73)),
                  )))
              .toList(),
          rows:
              // DataRow(
              //     cells: student
              //         .map((e) => DataCell(Text(
              //               e,
              //               style: TextStyle(
              //                   color: const Color.fromARGB(255, 2, 2, 2)),
              //             )))
              //         .toList()),
              student
                  .map((e) => DataRow(cells: [
                        DataCell(
                          Text(
                            "Ashiq",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 2, 2, 2)),
                          ),
                        ),
                        DataCell(present(psnt: e["1"]!)),
                        DataCell(present(psnt: e["2"]!)),
                        DataCell(present(psnt: e["3"]!)),
                        DataCell(present(psnt: e["4"]!)),
                        DataCell(present(psnt: e["5"]!)),
                        DataCell(present(psnt: e["6"]!)),
                      ]))
                  .toList(),
        ),
      ),
    );
  }
}

class present extends StatelessWidget {
  present({
    required this.psnt,
    super.key,
  });
  final bool psnt;
  @override
  Widget build(BuildContext context) {
    return psnt
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
