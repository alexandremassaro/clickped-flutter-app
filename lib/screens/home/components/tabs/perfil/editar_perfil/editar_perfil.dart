import 'package:clickped/components/rounded_button.dart';
import 'package:clickped/components/text_field_container.dart';
import 'package:clickped/models/user.dart';
import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditarPerfil extends StatefulWidget {
  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  String _currentNome = '';
  String _currentEmail = '';
  String _currentSenha = '';
  String _errorMessage = '';
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final User user = Provider.of<User>(context);

    void toggleShowPassword() => setState(() => _showPassword = !_showPassword);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Editar Perfil - ' + user.name),
        elevation: 0.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => print('Alterar foto'),
                child: Hero(
                  tag: 'foto_perfil',
                  child: CircleAvatar(
//                    backgroundImage: AssetImage('assets/images/banner1.jpg'),
                    backgroundColor: kPrimaryColor.withAlpha(30),
                    child: Icon(Icons.person, size: size.width/2, color: kSecondaryColor.withAlpha(50),),
                    radius: size.width/2 * .7,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
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
                    hintText: 'Alterar nome',
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
                    hintText: 'Alterar email',
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
                    hintText: 'Alterar senha',
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
//                setState(() => _errorMessage = validateForm());
//
//                if (_errorMessage == '') {
//                  dynamic result = await _auth.registerWithEmailAndPassword(_currentEmail, _currentSenha, _currentCPF, _currentNome);
//
//                  if (result == 'ERROR_EMAIL_ALREADY_IN_USE')
//                    setState(() => _errorMessage = 'Este email já tem cadastro em nosso app. Clique em esqueci minha senha para recuperar.');
//                  else if (result is String)
//                    setState(() => _errorMessage = result);
//                  else if (result == null)
//                    setState(() => _errorMessage = 'Erro ao efetuar cadastro.');
//                }
                },
                color: kPrimaryColor,
                child: Text(
                  'Salvar alterações',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
