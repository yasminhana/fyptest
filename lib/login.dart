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
            title: new Text("Subscribe using email to get notifications",
                textAlign: TextAlign.center),
            actions: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'email'),
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
                                Routes.home,
                              );
                            })),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                            child: const Text('CANCEL'),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                Routes.home,
                              );
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
              child: Text('ISE EYE'),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle, color: Colors.purple),
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(15.0),
            ),
            Container(
              child: const Text('Admin Login',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.all(15.0),
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'password'),
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
