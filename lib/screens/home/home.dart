
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

  int setCurrentIndex(index) {
    setState(() {
      _currentIndex = index;
    });
    return _currentIndex;
  }

  var tabs = [
    HomeTab(),
    ComandasTab(),
    // TODO: Implement "Perfil" tab in home screen
    Center(child: Text('Perfil')),
  ];

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    return Scaffold(
      backgroundColor: Colors.white,
      body: tabs[_currentIndex],
      bottomNavigationBar: HomeNavigationBar(
        press: (index) => setCurrentIndex(index),
        currentIndex: _currentIndex,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async { await _auth.signOut(); },
      child: Icon(Icons.chat),)
    );
  }
}


