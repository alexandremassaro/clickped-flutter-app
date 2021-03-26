import 'package:clickped/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 1,
          backgroundColor: Colors.white,
          navigateAfterSeconds: Wrapper(),
          loaderColor: Colors.transparent,
        ),
        Center(
          child: Container(
            width: size.width*.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/ClickPed_Logo_Dark_Ver.png'),
                    fit: BoxFit.fitWidth
                )
            ),
          ),
        )
      ],
    );
  }
}