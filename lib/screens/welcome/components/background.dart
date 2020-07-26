import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            child: Hero(
              tag: 'backgroundImage',
              child: Image(
                image: AssetImage('assets/images/banner1.jpg'),
                width: size.width,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
