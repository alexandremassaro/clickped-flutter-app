import 'package:clickped/models/comanda.dart';
import 'package:clickped/screens/home/components/tabs/home/components/cardapio/home_tab_cardapio.dart';
import 'package:clickped/screens/home/components/tabs/home/components/home_tab_welcome.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    Key key, this.comanda, this.checkIn,
  }) : super(key: key);

  final Comanda comanda;
  final Function checkIn;

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  Widget build(BuildContext context) {

    if (widget.comanda == null) {
      return HomeTabWelcome(checkin: widget.checkIn,);
    } else {
      return HomeTabCardapio(comanda: widget.comanda);
    }
  }
}
