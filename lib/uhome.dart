import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'routes.dart';

class Uhome extends StatefulWidget {
  const Uhome({Key? key}) : super(key: key);

  @override
  State<Uhome> createState() => _UhomeState();
}

class _UhomeState extends State<Uhome> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  final TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Homepage'),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.login,
                        );
                      })),
            ]),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 150,
                        width: 250,
                        child: Image.asset('logo.png')),
                    const Text(
                      "Announcement Section",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 150,
                      width: 300,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Center(
                          child: Text(
                            "Announcement" * 20,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 500,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      child: TableCalendar(
                        focusedDay: selectedDay,
                        firstDay: DateTime(2020),
                        lastDay: DateTime(2050),
                        calendarFormat: format,
                        onFormatChanged: (CalendarFormat _format) {
                          setState(() {
                            format = _format;
                          });
                        },
                        startingDayOfWeek: StartingDayOfWeek.sunday,
                        daysOfWeekVisible: true,

                        //Day Changed
                        onDaySelected: (DateTime selectDay, DateTime focusDay) {
                          setState(() {
                            selectedDay = selectDay;
                            focusedDay = focusDay;
                          });
                          print(focusedDay);
                        },
                        selectedDayPredicate: (DateTime date) {
                          return isSameDay(selectedDay, date);
                        },

                        //To style the Calendar
                        calendarStyle: const CalendarStyle(
                          isTodayHighlighted: true,
                          selectedDecoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          selectedTextStyle: TextStyle(color: Colors.white),
                          todayDecoration: BoxDecoration(
                            color: Colors.purpleAccent,
                            shape: BoxShape.circle,
                          ),
                          defaultDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          weekendDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          formatButtonShowsNext: false,
                          formatButtonDecoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          formatButtonTextStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}

class Event {
  final String title;
  Event({required this.title});

  String toString() => this.title;
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
              tileColor: Colors.blue,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.uhome,
                );
              }),
          ListTile(
              leading: const Icon(Icons.verified_user),
              title: const Text('Tournament'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.utournament,
                );
              }),
          ListTile(
              leading: const Icon(Icons.border_color),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.ugallery,
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
