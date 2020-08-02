import 'package:clickped/models/item_cardapio.dart';
import 'package:clickped/models/item_cardapio_opcao.dart';
import 'package:clickped/screens/home/components/tabs/home/components/cardapio/item_detalhe/components/confirmar_pedido.dart';
import 'package:clickped/screens/home/components/tabs/home/components/cardapio/item_detalhe/components/opcoes.dart';
import 'package:clickped/shared/constants.dart';
import 'package:clickped/shared/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetalhe extends StatefulWidget {
  final ItemCardapio itemCardapio;
  final String heroTag;

  const ItemDetalhe({Key key, this.itemCardapio, this.heroTag}) : super(key: key);

  @override
  _ItemDetalheState createState() => _ItemDetalheState();
}

class _ItemDetalheState extends State<ItemDetalhe> {
  double _total;
  int _quantidade = 1;
  Color _removeButtonColor = kPrimaryColor;
  Color _addButtonColor = kPrimaryColor;

  double calculaTotal() {
    double totalOpcoes = 0;
    for (ItemCardapioOpcao itemOps in widget.itemCardapio.opcoes)
      for (OpcaoItem op in itemOps.opcoes)
        if (op.selected)
          totalOpcoes += op.valor;

    return _quantidade * (widget.itemCardapio.preco + totalOpcoes);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    setState(() => _total = calculaTotal());
    setState(() => _quantidade <= 1 ? _removeButtonColor = Colors.grey : _removeButtonColor = kPrimaryColor);
    setState(() => _quantidade >= 99 ? _addButtonColor = Colors.grey : _addButtonColor = kPrimaryColor);

    void addQuantidade() {
      if (_quantidade < 99) setState(() => _quantidade += 1);
    }

    void removeQuantidade() {
      if (_quantidade > 1) setState(() => _quantidade -= 1);
    }

    Widget buttonConfirmar = FlatButton(
      color: kPrimaryColor,
      child: Text(
        'Confirmar',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        print('Confirmar');
        Navigator.of(context).pop();
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Detalhes do item', textAlign: TextAlign.center,),
        ),
      body:
      Container(
        width: size.width,
        height: size.height,

        child: Stack(
          children: <Widget>[

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Hero(
                      tag: widget.heroTag,
                      child: Image(
                        image: AssetImage(widget.itemCardapio.fotos[0]),
                        height: 200.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      widget.itemCardapio.nome,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      width: size.width,
                      child: Text(
                        widget.itemCardapio.descricao,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        getCurrencyText(widget.itemCardapio.preco),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: kAccentColor
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: kPrimaryColor.withAlpha(30),
                        ),
                        child: Row(
                          children: <Widget>[
                            RawMaterialButton(
                              child: Icon(Icons.remove, color: _removeButtonColor, ),
                              onPressed: () => removeQuantidade(),
                              enableFeedback: true,
                              elevation: 0.0,
                              splashColor: kPrimaryColor.withAlpha(50),
                              shape: CircleBorder(),

                            ),
                            ClipOval(
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                color: kPrimaryColor.withAlpha(150),
                                alignment: Alignment.center,
                                child: Text(
                                    _quantidade.toString(),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                    )
                                ),
                              ),
                            ),
                            RawMaterialButton(
                              child: Icon(Icons.add, color: _addButtonColor,),
                              onPressed: () => addQuantidade(),
                              enableFeedback: true,
                              elevation: 0.0,
                              splashColor: kPrimaryColor.withAlpha(50),
                              shape: CircleBorder(),
                            ),
                          ],
                        ),
//                        decoration: BoxDecoration(
//                          border: Border.all(color: Colors.grey, style: BorderStyle.solid),
//                          borderRadius: BorderRadius.circular(8.0),
//                        ),
                      ),
                    ],
                  ),
                  widget.itemCardapio.opcoes.length > 0 ? Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Divider(),
                      ),
                      for (ItemCardapioOpcao op in widget.itemCardapio.opcoes) Opcoes(opcao: op),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Divider(),
                      ),
                    ],
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Divider(),
                  ),
                  Text(
                    'Observação',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                style: BorderStyle.solid
                              )
                          ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: kPrimaryColor,
                                style: BorderStyle.solid
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100.0,),
                ],
              ),
            ),
          ),
            Positioned(
              bottom: 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: size.width,
                    height: 70.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: FlatButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: ConfirmarPedido(quantidade: _quantidade, widget: widget, total: _total, buttonConfirmar: buttonConfirmar),
                                );
                              },
                            );
                          },
                          color: kPrimaryColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Pedir',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                  getCurrencyText(_total),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight:
                                    FontWeight.bold,
                                    fontSize: 16.0,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
        ),
      ),
    );
  }
}
