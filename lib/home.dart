import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/material/floating_action_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map<DateTime, List<Event>> selectedEvents;
  DateTime today = DateTime.now();

  TextEditingController _eventController= TextEditingController();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose(){
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic eventLoader;
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Homepage'),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text('ANNOUNCEMENTS'),
              decoration:
                  BoxDecoration(shape: BoxShape.rectangle, color: Colors.green),
              padding: EdgeInsets.all(70.0),
              margin: EdgeInsets.all(15.0),
            ),
            Text("Selected Day = " + today.toString().split(" ")[0]),
            Container(
              child: TableCalendar(
                locale: "en_US",
                rowHeight: 43,
                headerStyle: HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2022, 1, 1),
                lastDay: DateTime.utc(2023, 12, 31),
                onDaySelected: _onDaySelected,
              ),
            ),
            eventLoader: _getEventsfromDay,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => showDialog(
                context: context, 
                builder: (context) =>AlertDialog(
                  title:Text("Add Event"),
                  content:TextFormField(
                    controller: _eventController,
                  ),
                  actions:[
                    TextButton(
                      child: Text("Cancel"),
                      onPressed: ()=> Navigator.pop(context),
                    ),
                    TextButton(
                      child: Text("Ok"),
                      onPressed: (){
                        if(_eventController.text.isEmpty){
                          Navigator.pop(context);
                          return;
                        }
                      },
                    ),
                  ],
                ),
              ), 
              label: Text:("Add Event"),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      )),
    );
  }
}

class Event {
  final String title;
  Event({required this.title});

  String toString() => this.title;
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'MENU',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.purple,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
          ListTile(
              leading: Icon(Icons.input),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.home,
                );
              }),
          ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Tournament'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.tournament,
                );
              }),
          ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Results'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.result,
                );
              }),
          ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Gallery'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.gallery,
                );
              }),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Login'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.login,
                );
              }),
        ],
      ),
    );
  }
}
