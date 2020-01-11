import 'package:flutter/material.dart';
import 'package:login_firebase/screens/logIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'KTMLABS',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
    );
  }
}
