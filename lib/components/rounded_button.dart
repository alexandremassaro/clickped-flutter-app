import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Widget child;
  final Function press;
  final Color color;
  final Color borderColor;

  const RoundedButton({
    Key key,
    this.child,
    this.press,
    this.color = kPrimaryColor,
    this.borderColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: borderColor),
        color: color,
      ),
      child: FlatButton(
        onPressed: press,
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: child,
      ),
    );
  }
}