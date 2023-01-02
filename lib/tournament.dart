import 'package:flutter/material.dart';
import 'routes.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class Tournament extends StatefulWidget {
  const Tournament({Key? key}) : super(key: key);

  @override
  State<Tournament> createState() => _TournamentState();
}

class _TournamentState extends State<Tournament> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tournament Page'),
      ),
    );
  }
}
