import 'package:flutter/material.dart';
// import 'package:fyptest/home.dart';
import 'routes.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class Uhome extends StatefulWidget {
  const Uhome({Key? key}) : super(key: key);

  @override
  State<Uhome> createState() => _UhomeState();
}

class _UhomeState extends State<Uhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Homepage'),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                    child: const Text('LOGIN FOR ADMIN'),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.login,
                      );
                    })),
            Container(
              child: Text('ANNOUNCEMENTS'),
              decoration:
                  BoxDecoration(shape: BoxShape.rectangle, color: Colors.green),
              padding: EdgeInsets.all(70.0),
              margin: EdgeInsets.all(15.0),
            )
          ],
        ),
      )),
    );
  }
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
