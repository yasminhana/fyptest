import 'package:flutter/material.dart';
import 'routes.dart';

class Uresult extends StatefulWidget {
  const Uresult({Key? key}) : super(key: key);

  @override
  State<Uresult> createState() => _UresultState();
}

class _UresultState extends State<Uresult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result Page'),
        ),
        body: Center(
            child: ListView(children: <Widget>[
          const Center(
              child: Text(
            'Result',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          DataTable(
            columns: const [
              DataColumn(
                  label: Text('Rank',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Name',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('yasmin hana')),
              ]),
              DataRow(cells: [
                DataCell(Text('2')),
                DataCell(Text('aisyah')),
              ]),
              DataRow(cells: [
                DataCell(Text('3')),
                DataCell(Text('dibqib')),
              ]),
            ],
          ),
        ])));
  }
}
