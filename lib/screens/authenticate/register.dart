import 'package:clickped/components/rounded_button.dart';
import 'package:clickped/components/text_field_container.dart';
import 'package:clickped/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:clickped/shared/constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _currentNome = '';
  String _currentCPF = '';

  var textEditingController = TextEditingController();
  var maskCPFFormatter = MaskTextInputFormatter(mask: "###.###.###-##", filter: { "#": RegExp(r'[0-9]') });
  //var maskEmailFormatter = MaskTextInputFormatter(filter: { "#": RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+") });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kSecondaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/clickped_logo_dark_hor.png'),
                  height: 30.0,
                ),
                SizedBox(height: 10.0,),
                Text(
                  'Criar Conta',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor,
                  ),
                ),
                SizedBox(height: 10.0,),
                TextFieldContainer(
                  child: TextField(
                    onChanged: (val) => setState(() => _currentNome = val),
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
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val) => setState(() => _currentNome = val),
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
                  child: TextField(
                    controller: textEditingController,
                    inputFormatters: [maskCPFFormatter],
                    keyboardType: TextInputType.number,
                    //onChanged: (val) => setState(() => _currentCPF = val),
                    onChanged: (val) => setState(() =>print(maskCPFFormatter.getUnmaskedText())),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      prefixIcon: Icon(MdiIcons.badgeAccountHorizontalOutline),
                      hintText: 'CPF',
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
                    onChanged: (val) => setState(() => _currentNome = val),
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
                TextFieldContainer(
                  child: TextFormField(
                    onChanged: (val) => setState(() => _currentNome = val),
                    obscureText: true,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.visibility_off),
                      hintText: 'Confirmar senha',
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
                SizedBox(height: 10.0,),
                RoundedButton(
                  press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
                  color: kPrimaryColor,
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 35.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
