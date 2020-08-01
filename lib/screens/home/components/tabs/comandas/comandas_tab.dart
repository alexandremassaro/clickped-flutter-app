import 'package:clickped/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ComandasTab extends StatefulWidget {
  @override
  _ComandasTabState createState() => _ComandasTabState();
}

class _ComandasTabState extends State<ComandasTab> {
  final PageController pageController = PageController(
    initialPage: 0
  );

  Color _page0 = kPrimaryColor;
  Color _page1 = kSecondaryColor;

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

  Widget getStatusContainer(int status) {
    Container _container;
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

  List<Pedido> pedidos = criarPedidos();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    int _page = 0;

    void goToPage(int page) {
      pageController.animateToPage(page, duration: Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
    }

    void pageChanged(int page) {
      setState(() {
        _page = page;
        if (_page == 0){
          _page0 = kPrimaryColor;
          _page1 = kSecondaryColor.withAlpha(30);
        } else {
          _page0 = kSecondaryColor.withAlpha(30);
          _page1 = kPrimaryColor;
        }

      });
    }

    return SafeArea(
      child: Container(
        width: size.width,
        child: Column(
          children: <Widget>[
            Container(
              height: 60.0,
              width: size.width,
              child: Center(
                child: Text(
                  'Comandas',
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: kSecondaryColor.withAlpha(30)))
              ),
            ),

            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => goToPage(0),
                      child: Container(
                        height: 60.0,
                        child: Center(
                          child: Text(
                            'Aberta',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: _page0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => goToPage(1),
                      child: Container(
                        height: 60.0,
                        child: Center(
                          child: Text(
                            'Histórico',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: _page1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: kSecondaryColor.withAlpha(30)))
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (page) => pageChanged(page),
                controller: pageController,
                children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Horário de chegada: 28/07/2020 15:08',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'Total: R\$ 200,00',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
//                              Text(
//                                'Pedidos:',
//                                style: TextStyle(
//                                    fontSize: 16.0,
//                                    fontWeight: FontWeight.bold
//                                ),
//                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: pedidos.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            if (pedidos[index].opcoes.isNotEmpty)
                            return ExpansionTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          '${pedidos[index].quantidade}x',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kSecondaryColor
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: size.width - 274,
                                        child: Text(
                                          pedidos[index].nome,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            color: kSecondaryColor
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    NumberFormat.simpleCurrency(locale: 'pt_BR').format(pedidos[index].valor),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      color: kSecondaryColor
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(child: getStatusContainer(pedidos[index].status)),
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
                                        NumberFormat.simpleCurrency(locale: 'pt_BR').format(pedidos[index].valor * pedidos[index].quantidade),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kSecondaryColor
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/banner1.jpg'),
                              ),
                              trailing: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              children: <Widget>[
                                Text('Opcionais'),
                                for (Opcao opcao in pedidos[index].opcoes)
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
                                        Text(NumberFormat.simpleCurrency(locale: 'pt_BR').format(opcao.valor))
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
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          '${pedidos[index].quantidade}x',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kSecondaryColor
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          pedidos[index].nome,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kSecondaryColor
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        NumberFormat.simpleCurrency(locale: 'pt_BR').format(pedidos[index].valor),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kSecondaryColor
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      getStatusContainer(pedidos[index].status),
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
                                            NumberFormat.simpleCurrency(locale: 'pt_BR').format(pedidos[index].valor * pedidos[index].quantidade),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: kSecondaryColor
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/banner1.jpg'),
                                  ),
                                ),
                              );
                          },
                        ),
                      ],
                    ),
                  ),
                  Text('Page 2'),
                ],
              ),
            )
          ],
        ),
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
