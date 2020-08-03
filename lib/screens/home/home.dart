
import 'package:clickped/models/comanda.dart';
import 'package:clickped/models/estabelecimento.dart';
import 'package:clickped/screens/home/components/tabs/comandas/comandas_tab.dart';
import 'package:clickped/screens/home/components/tabs/home/home_tab.dart';
import 'package:clickped/services/auth.dart';
import 'package:flutter/material.dart';
import 'components/home_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void setCurrentIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Comanda _comanda;

  void _checkIn() {
    setState(() {
      _comanda = Comanda(estabelecimento: Estabelecimento.getEstabecimentoFromDatabase(1), dataChegada: DateTime.now());
    });
  }

  Offset position =Offset(320.0, 665.0);

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    Size size = MediaQuery.of(context).size;

    var tabs = [
      HomeTab(comanda: _comanda, checkIn: _checkIn,),
      ComandasTab(comanda: _comanda),
      // TODO: Implement "Perfil" tab in home screen
      Center(child: Text('Perfil')),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        tabs[_currentIndex],
        if (_comanda != null) Positioned(
          left: position.dx,
          top:  position.dy,
          child: Draggable(
              feedback: FloatingActionButton(child: Icon(Icons.chat), onPressed: () async { await _auth.signOut(); }),
              child: FloatingActionButton(child: Icon(Icons.chat), onPressed: () async { await _auth.signOut(); }),
              childWhenDragging: Container(),
              onDragEnd: (details){
                setState(() {
                  position = details.offset;
                  if (position.dx > size.width - 60) position = Offset(size.width - 60, position.dy);
                  if (position.dy > size.height - 120) position = Offset(position.dx, size.height - 120);
                  if (position.dx < 5) position = Offset(5, position.dy);
                  if (position.dy < 50) position = Offset(position.dx, 50);
                });
              }
          ),
        ),
      ]),
      bottomNavigationBar: HomeNavigationBar(
        press: (index) => setCurrentIndex(index),
        currentIndex: _currentIndex,
      ),
      //floatingActionButton: FloatingActionButton(onPressed: () async { await _auth.signOut(); },
    );
  }
}


