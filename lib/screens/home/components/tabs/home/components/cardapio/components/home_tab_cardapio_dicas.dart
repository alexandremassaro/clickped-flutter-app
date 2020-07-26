import 'package:clickped/models/item_cardapio.dart';
import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeTabCardapioDicas extends StatelessWidget {
  const HomeTabCardapioDicas({
    Key key,
    @required List<ItemCardapio> cardapio,
  })  : _cardapio = cardapio,
        super(key: key);

  final List<ItemCardapio> _cardapio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Dicas da casa',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: kPrimaryColor),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 180.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _cardapio.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: <Widget>[
                    index == 0
                        ? SizedBox(
                            width: 15.0,
                          )
                        : SizedBox(
                            width: 0.0,
                          ),
                    Container(
                      margin: EdgeInsets.all(3.0),
                      width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey[300]),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 100.0,
                            width: 150.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0)),
                              child: Image(
                                image: AssetImage(_cardapio[index].fotos[0]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _cardapio[index].nome,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: kAccentColor),
                                ),
                                Text(_cardapio[index].categorias[0]),
                                Text(NumberFormat.simpleCurrency(locale: 'pt_BR').format(_cardapio[index].preco)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
