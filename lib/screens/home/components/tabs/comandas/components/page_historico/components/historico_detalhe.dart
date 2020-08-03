import 'package:clickped/models/comanda.dart';
import 'package:clickped/screens/home/components/tabs/comandas/components/components/item_comanda.dart';
import 'package:clickped/shared/utils.dart';
import 'package:flutter/material.dart';

class HistoricoDetalhe extends StatelessWidget {
  final Comanda comanda;

  const HistoricoDetalhe({Key key, this.comanda}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Detalhes da comanda'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: comanda.dataChegada,
              child: Image(
                width: size.width,
                height: 200.0,
                image: AssetImage(comanda.estabelecimento.foto),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      comanda.estabelecimento.nome,
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    children: <Widget>[
                      Text(
                        'Horário de chegada: ',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        getDateTimeText(comanda.dataChegada),
                        style: TextStyle(
                            fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Horário de saída: ',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        getDateTimeText(comanda.dataSaida),
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Total: ',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        getCurrencyText(comanda.getTotal()),
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
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
      ),
    );
  }
}
