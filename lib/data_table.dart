import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class attendenceTable extends StatefulWidget {
  const attendenceTable({super.key});

  @override
  State<attendenceTable> createState() => _attendenceTableState();
}

class _attendenceTableState extends State<attendenceTable> {
  List dates = ["Student", "Time", "01", "02", "03", "04", "05", "06"];
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
      appBar: AppBar(title: Text("February -- 2024")),
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
                        DataCell(Column(
                          children: [
                            Text("M"),
                            Text("E"),
                          ],
                        )),
                        DataCell(Column(
                          children: [
                            present(psnt: e["1"]!),
                            present(psnt: e["1"]!),
                          ],
                        )),
                        DataCell(Column(
                          children: [
                            present(psnt: e["2"]!),
                            present(psnt: e["2"]!),
                          ],
                        )),
                        DataCell(Column(
                          children: [
                            present(psnt: e["3"]!),
                            present(psnt: e["3"]!),
                          ],
                        )),
                        DataCell(Column(
                          children: [
                            present(psnt: e["4"]!),
                            present(psnt: e["4"]!),
                          ],
                        )),
                        DataCell(Column(
                          children: [
                            present(psnt: e["5"]!),
                            present(psnt: e["5"]!),
                          ],
                        )),
                        DataCell(Column(
                          children: [
                            present(psnt: e["6"]!),
                            present(psnt: e["6"]!),
                          ],
                        )),
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
