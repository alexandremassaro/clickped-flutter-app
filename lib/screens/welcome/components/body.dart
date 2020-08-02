import 'package:clickped/components/rounded_button.dart';
import 'package:clickped/components/sign_in_fields_container.dart';
import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Body extends StatelessWidget {
  final setScreen;

  const Body({Key key, this.setScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SignInFieldsContainer(
        children: <Widget>[
          Hero(
            tag: 'signInFieldsContainer',
            child: Image(
              image:
              AssetImage('assets/images/clickped_logo_dark_hor.png'),
              height: 30.0,
            ),
          ), // Header Clickped
          SizedBox(
            height: 10.0,
          ),
          RoundedButton(
            //press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Authenticate())),
            press: () => setScreen(1),
            color: kPrimaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                Text(
                  '  Conectar com email e senha',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ), // Conectar com email
          SizedBox(
            height: 5.0,
          ),
          RoundedButton(
            press: () {},
            color: facebookButtonColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  MdiIcons.facebook,
                  color: Colors.white,
                ),
                Text(
                  '  Conectar com Facebook',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ), // Conectar com Facebook
          SizedBox(
            height: 5.0,
          ),
          RoundedButton(
            press: () {},
            color: Colors.white,
            borderColor: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/google.png'),
                  width: 20.0,
                ),
                Text(
                  '  Conectar com Google',
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ],
            ),
          ), // Conectar com Google
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Não tem uma conta? ',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.grey,
                ),
              ),
              GestureDetector(
                //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Register())),
                onTap: () => setScreen(2),
                child: Text(
                  'Cadastre-se',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: kAccentColor,
                  ),
                ),
              ),
            ],
          ), // Footer Cadastre-se
        ],
      ),
    );
  }
}
