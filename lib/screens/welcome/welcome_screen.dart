import 'package:clickped/screens/authenticate/register.dart';
import 'package:clickped/screens/authenticate/sign_in.dart';
import 'package:clickped/screens/welcome/components/body.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _whichScreen = 0;

  @override
  Widget build(BuildContext context) {
    void setScreen(int screen) {
      print(screen);
      setState(() {
        _whichScreen = screen;
      });
    }

    if (_whichScreen == 0)
      return Body(setScreen: setScreen);
    else if (_whichScreen == 1)
      return SignIn(setScreen: setScreen);
    else
      return Register(setScreen: setScreen);

  }
}
