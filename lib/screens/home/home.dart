
import 'package:clickped/screens/home/components/tabs/home/home_tab.dart';
import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';
import 'components/home_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String _QRCode = '';

  int setCurrentIndex(index) {
    setState(() {
      _currentIndex = index;
    });
    return _currentIndex;
  }

  var tabs = [
    HomeTab(),
    // TODO: Implement "Comandas" tab in home screen
    Center(child: Text('Comandas')),
    // TODO: Implement "Perfil" tab in home screen
    Center(child: Text('Perfil')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: tabs[_currentIndex],
      bottomNavigationBar: HomeNavigationBar(
        press: (index) => setCurrentIndex(index),
        currentIndex: _currentIndex,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {  },
      child: Icon(Icons.chat),)
    );
  }
}


