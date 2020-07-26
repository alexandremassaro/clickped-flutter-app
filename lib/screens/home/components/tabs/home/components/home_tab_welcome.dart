
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeTabWelcome extends StatelessWidget {
  final Function checkin;

  const HomeTabWelcome({
    Key key, this.checkin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: SingleChildScrollView(

          child: Column(
            children: <Widget>[
              SizedBox(height: 40.0,),
              Image(
                image: AssetImage('assets/images/clickped_logo_dark_hor.png'),
                width: 300.0,
              ),
              SizedBox(height: 20.0,),
              Text(
                'Bem vindo',
                style: TextStyle(fontSize: 32.0),
              ),
              SizedBox(height: 30.0,),
              Text(
                'Para acessar o cardápio do restaurante clique no ícone abaixo e aponte a câmera para o QR Code em sua mesa.',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0,),
              IconButton(
                icon: Icon(MdiIcons.qrcodeScan),
                iconSize: 100.0,
                onPressed: checkin,
                  // TODO: Implement QR Code Scanning

              ),
            ],
          ),
        ),
      ),
    );
  }
}