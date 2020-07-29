import 'package:clickped/models/user.dart';
import 'package:clickped/screens/wrapper.dart';
import 'package:clickped/services/auth.dart';
import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'ClickPed',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          accentColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.transparent,
          fontFamily: 'Montserrat',
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: kPrimaryColor
          )
        ),
        locale: Locale.fromSubtags(countryCode: 'BRL'),
        home: Wrapper(),
      ),
    );
  }
}
