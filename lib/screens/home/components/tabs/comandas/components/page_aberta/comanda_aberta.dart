import 'package:clickped/shared/constants.dart';
import 'package:clickped/shared/utils.dart';
import 'package:flutter/material.dart';

class ComandaAberta extends StatelessWidget {
  final List<Pedido> pedidos = criarPedidos();

  static List<Opcao> criarOpcoes() {
    List<Opcao> _opcoes = List<Opcao>();

    _opcoes.add(Opcao(nome: 'Opção 1Opção 1Opção 1Opção 1Opção 1Opção 1Opção 1Opção 1Opção 1Opção 1Opção 1Opção 1Opção 1Opção 1', valor: 0.0));
    _opcoes.add(Opcao(nome: 'Opção 2', valor: 9.99));
    _opcoes.add(Opcao(nome: 'Opção 3', valor: 99.99));
    _opcoes.add(Opcao(nome: 'Opção 4Opção 4Opção 4Opção 4Opção 4Opção 4Opção 4Opção 4Opção 4Opção 4Opção 4Opção 4Opção 4', valor: 999.99));

    return _opcoes;

  }

  static List<Pedido> criarPedidos() {
    List<Pedido> _pedidos = List<Pedido>();

    _pedidos.add(Pedido(nome: 'Nome 1Nome 1Nome 1Nome 1Nome 1Nome 1Nome 1Nome 1Nome 1Nome 1', quantidade: 99, valor: 99999.99, opcoes: List<Opcao>(),status: 1));
    _pedidos.add(Pedido(nome: 'Nome 2Nome 2Nome 2Nome 2Nome 2Nome 2Nome 2Nome 2Nome 2Nome 2', quantidade: 1, valor: 2.75, opcoes: criarOpcoes(),status: 2));
    _pedidos.add(Pedido(nome: 'Nome 3', quantidade: 1, valor: 999.99, opcoes: List<Opcao>(),status: 3));
    _pedidos.add(Pedido(nome: 'Nome 4', quantidade: 1, valor: 9999.99, opcoes: List<Opcao>(),status: 4));
    _pedidos.add(Pedido(nome: 'Nome 5', quantidade: 1, valor: 99999.99, opcoes: List<Opcao>(),status: 5));
    _pedidos.add(Pedido(nome: 'Nome 6', quantidade: 1, valor: 99999.99, opcoes: List<Opcao>(),status: 4));
    _pedidos.add(Pedido(nome: 'Nome 7', quantidade: 1, valor: 99999.99, opcoes: List<Opcao>(),status: 4));
    _pedidos.add(Pedido(nome: 'Nome 8', quantidade: 1, valor: 99999.99, opcoes: List<Opcao>(),status: 4));
    _pedidos.add(Pedido(nome: 'Nome 9', quantidade: 1, valor: 99999.99, opcoes: List<Opcao>(),status: 4));
    _pedidos.add(Pedido(nome: 'Nome 10', quantidade: 99, valor: 99999.99, opcoes: List<Opcao>(),status: 4));

    return _pedidos;
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HeaderText(text: 'Horário de chegada: 28/07/2020 15:08',),
                HeaderText(text: 'Total: R\$ 200,00',),
              ],
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: pedidos.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ItemComanda(pedido: pedidos[index]);
            },
          ),
        ],
      ),
    );
  }
}

class ItemComanda extends StatelessWidget {
  const ItemComanda({
    Key key,
    @required this.pedido
  }) : super(key: key);

  final Pedido pedido;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (pedido.opcoes.isNotEmpty)
      return ExpansionTile(
        title: ItemComandaTitle(pedido: pedido),
        subtitle: ItemComandaSubtitle(pedido: pedido),
        leading: ItemComandaLeading(imagePath: 'assets/images/banner1.jpg'),
        trailing: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey,
        ),
        children: <Widget>[
          Text('Opcionais'),
          for (Opcao opcao in pedido.opcoes)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
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
          SizedBox(height: 10.0,)
        ],
      );
    else
      return Container(
        width: size.width,
        child: ListTile(
          title: ItemComandaTitle(pedido: pedido),
          subtitle: ItemComandaSubtitle(pedido: pedido),
          leading: ItemComandaLeading(imagePath: 'assets/images/banner1.jpg'),
        ),
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
            pedido.nome,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kSecondaryColor
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          getCurrencyText(pedido.valor),
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
              getCurrencyText(pedido.valor * pedido.quantidade),
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

class Pedido {
  final String nome;
  final int quantidade;
  final double valor;
  final List<Opcao> opcoes;
  int status;

  Pedido({ this.nome, this.quantidade, this.valor, this.opcoes, this.status });

}

class Opcao {
  final String nome;
  final double valor;

  Opcao({ this.nome, this.valor });

}