import 'package:clickped/screens/home/components/tabs/home/components/cardapio/item_detalhe/item_detalhe.dart';
import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConfirmarPedido extends StatelessWidget {
  const ConfirmarPedido({
    Key key,
    @required int quantidade,
    @required this.widget,
    @required double total,
    @required this.buttonConfirmar,
  }) : _quantidade = quantidade, _total = total, super(key: key);

  final int _quantidade;
  final ItemDetalhe widget;
  final double _total;
  final Widget buttonConfirmar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          right: -35.0,
          top: -30.0,
          child: InkResponse(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CircleAvatar(
              radius: 15.0,
              child: Icon(Icons.close, color: Colors.white,),
              backgroundColor: kPrimaryColor,
            ),
          ),
        ),
        Container(
          height: 265.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/clickped_logo_dark_hor.png'),
                width: 200.0,
              ),
              SizedBox(height: 20.0,),
              Text(
                'Confirme seu pedido',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Divider(),
              ),
              Container(
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('${_quantidade}x '),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        width: 100.0,
                        child: Text(widget.itemCardapio.nome, overflow: TextOverflow.clip,),
                      ),
                    ),
                    Text(NumberFormat.simpleCurrency(locale: 'pt_BR').format(_total)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Divider(),
              ),
              Container(
                height: 35.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: buttonConfirmar,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}