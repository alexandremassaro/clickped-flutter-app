
import 'package:clickped/models/user.dart';
import 'package:clickped/screens/home/home.dart';
import 'package:clickped/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //print(user.toString());

    if (user == null) {
      return WelcomeScreen();
    } else {
      return HomeScreen();
    }
  }

}

