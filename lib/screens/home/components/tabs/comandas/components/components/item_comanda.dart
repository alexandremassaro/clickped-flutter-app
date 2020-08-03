import 'package:clickped/models/item_cardapio_opcao.dart';
import 'package:clickped/models/pedido.dart';
import 'package:clickped/shared/constants.dart';
import 'package:clickped/shared/utils.dart';
import 'package:flutter/material.dart';


class ItemComanda extends StatelessWidget {
  const ItemComanda({
    Key key,
    @required this.pedido
  }) : super(key: key);

  final Pedido pedido;
  @override
  Widget build(BuildContext context) {

    return ExpansionTile(
      title: ItemComandaTitle(pedido: pedido),
      subtitle: ItemComandaSubtitle(pedido: pedido),
      leading: ItemComandaLeading(imagePath: pedido.item.fotos[0]),

      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text('Pedido às: ${getDateTimeText(pedido.dataPedido)}'),
        ),
        if (pedido.item.opcoes.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text('Opcionais'),
          ),
        for (ItemCardapioOpcao opcionais in pedido.item.opcoes)
          for (OpcaoItem opcao in opcionais.opcoes)
            if (opcao.selected)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          opcao.nome,
                          overflow: TextOverflow.ellipsis,
                        )
                    ),
                    Text(getCurrencyText(opcao.valor))
                  ],
                ),
              ),
        if (pedido.observacao.trim().isNotEmpty)
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text('Observação:'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(pedido.observacao.trim()),
              ),
            ],
          ),
      ],
    );
  }
}


class ItemComandaLeading extends StatelessWidget {
  const ItemComandaLeading({
    Key key,
    @required this.imagePath
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(imagePath),
    );
  }
}

class ItemComandaTitle extends StatelessWidget {
  const ItemComandaTitle({
    Key key,
    @required this.pedido,
  }) : super(key: key);

  final Pedido pedido;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Text(
            '${pedido.quantidade}x',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kSecondaryColor
            ),
          ),
        ),
        Expanded(
          child: Text(
            pedido.item.nome,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kSecondaryColor
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          getCurrencyText(pedido.getValorUnitario()),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kSecondaryColor
          ),
        ),
      ],
    );
  }
}

class ItemComandaSubtitle extends StatelessWidget {
  const ItemComandaSubtitle({
    Key key,
    @required this.pedido,
  }) : super(key: key);

  final Pedido pedido;

  Widget getStatusContainer(int status) {
    String text = 'Enviado';

    if (status == 1) {
      text = 'Enviado';
    } else if (status == 2) {
      text = 'Preparando';
    } else if (status == 3) {
      text = 'Entregando';
    } else if (status == 4) {
      text = 'Finalizado';
    } else if (status == 5) {
      text = 'Cancelado';
    }

    return Container(
      child: Text(
        text,
        style: TextStyle(
            color: kSecondaryColor
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(child: getStatusContainer(pedido.status)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Total:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor
                ),
              ),
            ),
            Text(
              getCurrencyText(pedido.getTotal()),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kSecondaryColor
              ),
            ),
          ],
        ),
      ],
    );
  }
}