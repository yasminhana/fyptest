import 'package:flutter/material.dart';
import 'routes.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class Utournament extends StatefulWidget {
  const Utournament({Key? key}) : super(key: key);

  @override
  State<Utournament> createState() => _UtournamentState();
}

class _UtournamentState extends State<Utournament> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tournament Page'),
      ),
    );
  }
}
