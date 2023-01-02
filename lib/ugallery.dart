import 'package:flutter/material.dart';
import 'routes.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class Ugallery extends StatefulWidget {
  const Ugallery({Key? key}) : super(key: key);

  @override
  State<Ugallery> createState() => _UgalleryState();
}

class _UgalleryState extends State<Ugallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery Page'),
      ),
    );
  }
}
