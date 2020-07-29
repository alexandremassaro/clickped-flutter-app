import 'package:clickped/components/rounded_button.dart';
import 'package:clickped/components/text_field_container.dart';
import 'package:clickped/screens/home/home.dart';
import 'package:clickped/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:clickped/shared/constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Register extends StatefulWidget {
  final setScreen;

  const Register({Key key, this.setScreen}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  // Text field state
  String _currentNome = '';
  String _currentEmail = '';
  String _currentCPF = '';
  String _currentSenha = '';
  String _currentSenhaConfirma = '';

  String _errorMessage = '';

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  var textEditingController = TextEditingController();
  var maskCPFFormatter = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

  ////var maskEmailFormatter = MaskTextInputFormatter(filter: { "#": RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+") });

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
    if (_currentNome.trim().isEmpty) return 'Escreva seu nome completo';
    if (validateEmail(_currentEmail.trim())) return 'Email inválido';
    if (_currentCPF.trim().length != 11) return 'CPF inválido';
    if (_currentSenha.trim().length < 6)
      return 'Senha deve ter pelo menos 6 caracteres, e ao menos 1 letra e 1 número';
    if (_currentSenhaConfirma.trim() != _currentSenha.trim())
      return 'A confirmação deve ser igual a senha';

    return '';
  }

  @override
  Widget build(BuildContext context) {
    void toggleShowPassword() => setState(() => _showPassword = !_showPassword);
    void toggleShowConfirmPassword() => setState(() => _showConfirmPassword = !_showConfirmPassword);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kSecondaryColor,
          ),
          //onPressed: () => Navigator.pop(context),
          onPressed: () => widget.setScreen(0),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image:
                        AssetImage('assets/images/clickped_logo_dark_hor.png'),
                    height: 30.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Criar Conta',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: kSecondaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      onChanged: (val) =>
                          setState(() => _currentNome = val.trim()),
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Nome',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 5, right: 15),
                      ),
                      //decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) =>
                          setState(() => _currentEmail = val.trim()),
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
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 5, right: 15),
                      ),
                      //decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      controller: textEditingController,
                      inputFormatters: [maskCPFFormatter],
                      keyboardType: TextInputType.number,
                      //onChanged: (val) => setState(() => _currentCPF = val),
                      onChanged: (val) => setState(() => _currentCPF =
                          maskCPFFormatter.getUnmaskedText().trim()),
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(MdiIcons.badgeAccountHorizontalOutline),
                        hintText: 'CPF',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 5, right: 15),
                      ),
                      //decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      onChanged: (val) =>
                          setState(() => _currentSenha = val.trim()),
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
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 5, right: 15),
                      ),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      onChanged: (val) =>
                          setState(() => _currentSenhaConfirma = val.trim()),
                      obscureText:  _showConfirmPassword ? false : true,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                            onTap: () => toggleShowConfirmPassword(),
                            child: Icon(_showConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        hintText: 'Confirmar senha',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 5, right: 15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    _errorMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RoundedButton(
                    //press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
                    press: () async {
                      setState(() => _errorMessage = validateForm());

                      if (_errorMessage == '') {
                        dynamic result = await _auth.registerWithEmailAndPassword(_currentEmail, _currentSenha, _currentCPF, _currentNome);

                        if (result == 'ERROR_EMAIL_ALREADY_IN_USE')
                          setState(() => _errorMessage = 'Este email já tem cadastro em nosso app. Clique em esqueci minha senha para recuperar.');
                        else if (result is String)
                          setState(() => _errorMessage = result);
                        else if (result == null)
                          setState(() => _errorMessage = 'Erro ao efetuar cadastro.');
                      }
                    },
                    color: kPrimaryColor,
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Ao clicar em Cadastrar você estará',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      color: kSecondaryColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'aceitando nossos ',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: kSecondaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => print('Termos e Condições'),
                        child: Text(
                          'Termos e Condições',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: kSecondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Esqueci minha senha',
                    style: TextStyle(color: kAccentColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
