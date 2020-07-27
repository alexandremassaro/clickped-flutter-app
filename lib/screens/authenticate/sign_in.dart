import 'package:clickped/components/rounded_button.dart';
import 'package:clickped/components/sign_in_fields_container.dart';
import 'package:clickped/components/text_field_container.dart';
import 'package:clickped/screens/authenticate/register.dart';
import 'package:clickped/screens/home/home.dart';
import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _currentEmail = '';
  String _currentPassword = '';

  @override
  Widget build(BuildContext context) {
    void _showLogInPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 5.0,
                ),
              ],
            );
          });
    }

    return SignInFieldsContainer(
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Hero(
            tag: 'signInFieldsContainer',
            child: Image(
              image: AssetImage('assets/images/clickped_logo_dark_hor.png'),
              height: 30.0,
            ),
          ),
        ), // Header Clickped
        SizedBox(
          height: 10.0,
        ),
        Text('Bem vindo de volta'),
        TextFieldContainer(
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (val) => setState(() => _currentEmail = val),
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.grey,
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail),
              hintText: 'Email',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: kPrimaryColor, style: BorderStyle.solid)),
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 5, right: 15),
            ),
            //decoration: textInputDecoration.copyWith(hintText: 'Email'),
          ),
        ),

        TextFieldContainer(
          child: TextFormField(
            onChanged: (val) => setState(() => _currentPassword = val),
            obscureText: true,
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.grey,
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              suffixIcon: Icon(Icons.visibility_off),
              hintText: 'Senha',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: kPrimaryColor, style: BorderStyle.solid)),
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 5, right: 15),
            ),
          ),
        ),
        SizedBox(height: 30,),
        RoundedButton(
          press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
          color: kPrimaryColor,
          child: Text(
            'Acessar',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 30,),
        Text('Esqueceu sua senha?'),
        SizedBox(height: 30,),
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
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Register())),
              child: Text(
                'Cadastre-se',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: kAccentColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
