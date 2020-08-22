import 'package:clickped/screens/home/components/tabs/perfil/editar_perfil/editar_perfil.dart';
import 'package:clickped/screens/home/components/tabs/perfil/formas_pagamento/formas_pagamento.dart';
import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';

class PerfilTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: ((context, index){
          switch (index) {
            case 0: {
              return Card(
                child: ListTile(
                  title: Text('Alexandre Massaro'),
                  subtitle: Text('Editar perfil'),
                  leading: Hero(
                    tag: 'foto_perfil',
                    child: CircleAvatar(
                      //backgroundImage: AssetImage('assets/images/banner1.jpg'),
                      backgroundColor: kPrimaryColor.withAlpha(30),
                      child: Icon(Icons.person, color: kSecondaryColor.withAlpha(50),),
                    ),
                  ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditarPerfil())),
                ),
              );
            }
            case 1: {
              return Card(
                child: ListTile(
                  title: Text('Pagamento'),
                  subtitle: Text('Alterar formas de pagamento'),
                  leading: Icon(
                    Icons.credit_card,
                    size: 40.0,
                  ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FormasPagamento())),
                ),
              );
            }
            break;
            default: {
              return Container();
            }
            break;
          }
        }),
      ),
    );
  }
}
