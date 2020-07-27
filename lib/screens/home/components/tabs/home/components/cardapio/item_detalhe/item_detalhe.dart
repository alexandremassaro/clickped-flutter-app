import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemDetalhe extends StatefulWidget {
  final itemCardapio;
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    setState(() => _total = _quantidade * widget.itemCardapio.preco);
    setState(() => _quantidade <= 1 ? _removeButtonColor = Colors.grey : _removeButtonColor = kPrimaryColor);
    setState(() => _quantidade >= 99 ? _addButtonColor = Colors.grey : _addButtonColor = kPrimaryColor);

    void addQuantidade() {
      _quantidade < 99 ? setState(() => _quantidade += 1) : null ;
    }

    void removeQuantidade() {
      _quantidade > 1 ? setState(() => _quantidade -= 1) : null ;
    }

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
                  Text(
                    NumberFormat.simpleCurrency(locale: 'pt_BR').format(widget.itemCardapio.preco),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: kAccentColor
                    ),
                  ),
                  Padding(
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
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                style: BorderStyle.solid
                              )
                          ),
                        focusedBorder: OutlineInputBorder(
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
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(color: Colors.grey,style: BorderStyle.solid)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            width: 120.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: (Icon(Icons.remove, color: _removeButtonColor,)),
                                  onPressed: () => removeQuantidade(),
                                  enableFeedback: true,
                                ),
                                Text(
                                    _quantidade.toString(),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    )
                                ),
                                IconButton(
                                  icon: (Icon(Icons.add, color: _addButtonColor,)),
                                  onPressed: () => addQuantidade(),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: FlatButton(
                                  onPressed: () {  },
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
                                          NumberFormat.simpleCurrency().format(_total),
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
