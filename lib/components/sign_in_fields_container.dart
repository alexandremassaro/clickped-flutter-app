import 'package:clickped/screens/welcome/components/background.dart';
import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';

class SignInFieldsContainer extends StatelessWidget {
  final List<Widget> children;

  const SignInFieldsContainer({
    Key key,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Positioned(
        bottom: 0.0,
        child: Container(
          decoration: signInPageContainerDecoration,
          child: SizedBox(
            width: size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
