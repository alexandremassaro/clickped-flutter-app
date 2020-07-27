
import 'package:clickped/screens/home/components/tabs/home/components/cardapio/home_tab_cardapio.dart';
import 'package:clickped/screens/home/components/tabs/home/components/home_tab_welcome.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    Key key,
  }) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool _isCheckedIn = false;

  void isCheckedIn() {
    print('isCheckedIn');
    setState(() {
      _isCheckedIn = !_isCheckedIn;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (!_isCheckedIn) {
      return HomeTabWelcome(checkin: isCheckedIn,);
    } else {
      return HomeTabCardapio();
    }
  }
}
