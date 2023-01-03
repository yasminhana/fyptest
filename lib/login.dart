import 'package:flutter/material.dart';
import 'package:fyptest/main.dart';
import 'routes.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var password;

  void _setPassword(String text) {
    setState(() {
      password = text;
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Subscribe using email to get notifications",
                textAlign: TextAlign.center),
            actions: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: 'email'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            _setPassword(text);
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                Routes.uhome,
                              );
                            })),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                            child: const Text('CANCEL'),
                            onPressed: () {
                              Navigator.pop(context);
                            })),
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login Page'),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: const Text('ISE EYE'),
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle, color: Colors.purple),
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(15.0),
            ),
            Container(
              child: const Text('Admin Login',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(15.0),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    _setPassword(text);
                  },
                )),
            Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.home,
                      );
                    })),
            Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                    child: const Text('Continue as guest'),
                    onPressed: _showDialog)),
          ],
        ),
      )),
    );
  }
}
