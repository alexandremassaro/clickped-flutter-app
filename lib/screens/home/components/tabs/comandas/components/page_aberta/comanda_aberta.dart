import 'package:clickped/models/comanda.dart';
import 'package:clickped/screens/home/components/tabs/comandas/components/components/item_comanda.dart';
import 'package:clickped/shared/constants.dart';
import 'package:clickped/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ComandaAberta extends StatelessWidget {
  final Comanda comanda;

  const ComandaAberta({Key key, this.comanda}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      HeaderText(text: 'Horário de chegada:',),
                      Text(getDateTimeText(comanda.dataChegada)),
                      HeaderText(text: 'Total: ${getCurrencyText(comanda.getTotal())}',),
                    ],
                  ),
                ),
                FlatButton(
                  child: Column(
                    children: <Widget>[
                      Icon(MdiIcons.cashUsdOutline),
                      Text('Pagar'),
                    ],
                  ),
                  textColor: kAccentColor,
                  // TODO: Implement Payment button click
                  onPressed: (){},
                ),
              ],
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: comanda.pedidos.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ItemComanda(pedido: comanda.pedidos[index]);
            },
          ),
        ],
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({
    Key key, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold
      ),
    );
  }
}