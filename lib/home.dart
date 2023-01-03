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
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
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
      ),
      body: Column(
        children: [
          Column(),
          TableCalendar(
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

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
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
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map(
            (Event event) => ListTile(
              title: Text(
                event.title,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Add Event"),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {
                  } else {
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay]?.add(
                        Event(title: _eventController.text),
                      );
                    } else {
                      selectedEvents[selectedDay] = [
                        Event(title: _eventController.text)
                      ];
                    }
                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState(() {});
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("Add Event"),
        icon: Icon(Icons.add),
      ),
    );
  }
}

// class _HomeState extends State<Home> {
//   late Map<DateTime, List<Event>> selectedEvents;
//   DateTime today = DateTime.now();

//   TextEditingController _eventController= TextEditingController();

//   void _onDaySelected(DateTime day, DateTime focusedDay) {
//     setState(() {
//       today = day;
//     });
//   }

//   @override
//   void initState() {
//     selectedEvents = {};
//     super.initState();
//   }

//   List<Event> _getEventsfromDay(DateTime date) {
//     return selectedEvents[date] ?? [];
//   }

//   @override
//   void dispose(){
//     _eventController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     dynamic eventLoader;
// return Scaffold(
//   drawer: NavDrawer(),
//   appBar: AppBar(
//     centerTitle: true,
//     title: const Text('Homepage'),
//   ),
//       body: Center(
//           child: Container(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               child: Text('ANNOUNCEMENTS'),
//               decoration:
//                   BoxDecoration(shape: BoxShape.rectangle, color: Colors.green),
//               padding: EdgeInsets.all(70.0),
//               margin: EdgeInsets.all(15.0),
//             ),
//             Text("Selected Day = " + today.toString().split(" ")[0]),
//             Container(
//               child: TableCalendar(
//                 locale: "en_US",
//                 rowHeight: 43,
//                 headerStyle: HeaderStyle(
//                     formatButtonVisible: false, titleCentered: true),
//                 availableGestures: AvailableGestures.all,
//                 selectedDayPredicate: (day) => isSameDay(day, today),
//                 focusedDay: today,
//                 firstDay: DateTime.utc(2022, 1, 1),
//                 lastDay: DateTime.utc(2023, 12, 31),
//                 onDaySelected: _onDaySelected,
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }

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
