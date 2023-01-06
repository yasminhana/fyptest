import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Tournament extends StatefulWidget {
  const Tournament({Key? key}) : super(key: key);

  @override
  State<Tournament> createState() => _TournamentState();
}

class _TournamentState extends State<Tournament> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Tournament Page'),
        ),
        body: Center(
            child: DropdownButtonHideUnderline(
                child: Column(children: <Widget>[
          const Text("Select tournament and event",
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 8, fontSize: 20)),
          const Text(
            "Event:",
            textAlign: TextAlign.left,
          ),
          //dropdown event
          Container(
            padding: const EdgeInsets.all(20),
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                children: const [
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      'Select Event',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                });
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.grey,
              buttonHeight: 50,
              buttonWidth: 250,
              buttonPadding: const EdgeInsets.only(left: 14, right: 14),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.blueAccent,
              ),
              buttonElevation: 2,
              itemHeight: 40,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 200,
              dropdownWidth: 300,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.blueGrey,
              ),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              offset: const Offset(-20, 0),
            ),
          ),
          TextButton(
            child: const Text("Add Event"),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Add Event"),
                content: TextFormField(
                  decoration: const InputDecoration(labelText: 'Event'),
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
              ),
            ),
          ),

          const Text(
            "Tournament:",
            textAlign: TextAlign.left,
          ),
          //dropdown tournament
          Container(
            padding: const EdgeInsets.all(20),
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                children: const [
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      'Select Tournament',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                });
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.grey,
              buttonHeight: 50,
              buttonWidth: 250,
              buttonPadding: const EdgeInsets.only(left: 14, right: 14),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.blueAccent,
              ),
              buttonElevation: 2,
              itemHeight: 40,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 200,
              dropdownWidth: 300,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.blueGrey,
              ),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              offset: const Offset(-20, 0),
            ),
          ),
          TextButton(
            child: const Text("Add Tournament"),
            onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Add Tournament"),
                      content: TextFormField(
                        decoration: const InputDecoration(labelText: 'Event'),
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
          ),
          SizedBox(
              height: 30,
              width: 100,
              child: ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.uresult,
                    );
                  })),
        ]))));
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
          const DrawerHeader(
            child: Text(
              'MENU',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 64, 112, 134),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
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
