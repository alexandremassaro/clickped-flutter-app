import 'file:///E:/Documents/Flutter_Projects/clickped/lib/screens/authenticate/authenticate.dart';
import 'package:clickped/screens/home/home.dart';
import 'package:clickped/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  bool _logedIn = false;

  @override
  Widget build(BuildContext context) {
    if (!_logedIn) {
      return WelcomeScreen();
    } else {
      return HomeScreen();
    }
  }
}
