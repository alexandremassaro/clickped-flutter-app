import 'package:clickped/components/rounded_button.dart';
import 'package:clickped/components/sign_in_fields_container.dart';
import 'package:clickped/components/text_field_container.dart';
import 'package:clickped/services/auth.dart';
import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final setScreen;

  const SignIn({Key key, this.setScreen}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String _currentEmail = '';
  String _currentSenha = '';

  // Text field state

  String _errorMessage = '';

  bool _showPassword = false;

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? true : false;
  }

  bool validateSenha(String value) {
    Pattern pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? true : false;
  }

  String validateForm() {
    if (validateEmail(_currentEmail.trim())) return 'Email inválido';
    if (_currentSenha.trim().length < 6)
      return 'Senha deve ter pelo menos 6 caracteres, e ao menos 1 letra e 1 número';

    return '';
  }

  @override
  Widget build(BuildContext context) {

    void toggleShowPassword() => setState(() => _showPassword = !_showPassword);

    return Scaffold(
      body: Form(
        //key: 'signInFormKey',
        child: SignInFieldsContainer(
          children: <Widget>[
            GestureDetector(
              //onTap: () => Navigator.pop(context),
              onTap: () => widget.setScreen(0),
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
              child: TextFormField(
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
                onChanged: (val) => setState(() => _currentSenha = val),
                obscureText: _showPassword ? false : true,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                      onTap: () => toggleShowPassword(),
                      child: Icon(_showPassword
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  hintText: 'Senha',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 5, right: 15),
                ),
              ),
            ),
            Text(
              _errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            RoundedButton(
              //press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
              press: () async {
                setState(() => _errorMessage = validateForm());

                if (_errorMessage == '') {
                  dynamic result = await _auth.signInWithEmailAndPassword(_currentEmail, _currentSenha);

                  if (result == 'ERROR_USER_NOT_FOUND')
                    setState(() => _errorMessage = 'Este email não foi encontrado em nosso cadastro.');
                  else if (result == 'ERROR_WRONG_PASSWORD')
                    setState(() => _errorMessage = 'Senha incorreta.');
                  else if (result is String)
                    setState(() => _errorMessage = result);
                  else if (result == null)
                    setState(() => _errorMessage = 'Erro ao tentar acessar.');
                }
              },
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
                  onTap: () {
                    //Navigator.of(context).pop();
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                    widget.setScreen(2);
                  },
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
        ),
      ),
    );
  }
}
