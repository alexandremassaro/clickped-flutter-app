import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';

class HomeNavigationBar extends StatelessWidget {
  final Function press;
  final int currentIndex;

  const HomeNavigationBar({Key key, this.press, this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: press,
      type: BottomNavigationBarType.fixed,
      elevation: 5.0,
      backgroundColor: Colors.grey[150],
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          title: Text('Comandas'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Perfil'),
        ),
      ],
    );
    ;
  }
}
