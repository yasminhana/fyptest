import 'package:flutter/material.dart';
import 'routes.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: const Text('Result Page'),
        ),
        body: Center(
            child: ListView(children: <Widget>[
          const Text(
            "Result",
            style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 3),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Event:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ), //kat sini nak panggil balik event yg dia choose kat dropdown tadi
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Tournament:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ), //kat sini nak panggil balik tournament yg dia choose kat dropdown tadi
          ),
          DataTable(
            columns: const [
              DataColumn(
                  label: Text('Rank',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Name',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold))),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('Winner')),
                DataCell(Text('yasmin hana')),
              ]),
              DataRow(cells: [
                DataCell(Text('2nd place')),
                DataCell(Text('aisyah')),
              ]),
              DataRow(cells: [
                DataCell(Text('3rd place')),
                DataCell(Text('dibqib')),
              ]),
            ],
          ),
          SizedBox(
              child: ElevatedButton(
                  child: const Text('Add name'),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text("Add participant"),
                            content: Form(
                                key: _formKey,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const TextField(
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.account_circle),
                                          labelText: 'Winner',
                                        ),
                                      ),
                                      const TextField(
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.account_circle),
                                          labelText: '2nd Place',
                                        ),
                                      ),
                                      const TextField(
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.account_circle),
                                          labelText: '3rd Place',
                                        ),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(10)),
                                      ElevatedButton(
                                        child: const Text("Update"),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ])),
                          )))),
          DataTable(
            columns: const [
              DataColumn(
                  label: Text('Participants',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold))),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('yasmin hana')),
              ]),
              DataRow(cells: [
                DataCell(Text('aisyah')),
              ]),
              DataRow(cells: [
                DataCell(Text('dibqib')),
              ]),
              DataRow(cells: [
                DataCell(Text('yasmin hana')),
              ]),
              DataRow(cells: [
                DataCell(Text('aisyah')),
              ]),
              DataRow(cells: [
                DataCell(Text('dibqib')),
              ]),
            ],
          ),
          SizedBox(
              child: ElevatedButton(
            child: const Text('Add participant'),
            onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Add participant"),
                      content: TextFormField(
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      actions: [
                        TextButton(
                          child: const Text("Cancel"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        TextButton(
                          child: const Text("Ok"),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    )),
          )),
          Container(padding: const EdgeInsets.all(20))
        ])));
  }
}

//sidebar menu
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(padding: const EdgeInsets.all(20)),
          SizedBox(height: 50, width: 50, child: Image.asset('logo.png')),
          Container(padding: const EdgeInsets.all(20)),
          ListTile(
              leading: const Icon(Icons.input),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.home,
                );
              }),
          ListTile(
              leading: const Icon(Icons.verified_user),
              title: const Text('Tournament'),
              tileColor: Colors.blue,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.tournament,
                );
              }),
          ListTile(
              leading: const Icon(Icons.border_color),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.gallery,
                );
              }),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.uhome,
                );
              }),
        ],
      ),
    );
  }
}
