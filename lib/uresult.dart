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
    );
  }
}
