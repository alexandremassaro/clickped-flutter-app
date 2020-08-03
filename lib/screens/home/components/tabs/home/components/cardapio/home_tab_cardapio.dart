import 'package:clickped/models/cardapio.dart';
import 'package:clickped/models/comanda.dart';
import 'package:clickped/models/item_cardapio.dart';
import 'package:clickped/screens/home/components/tabs/home/components/cardapio/components/cardapio_categorias_delegate.dart';
import 'package:clickped/screens/home/components/tabs/home/components/cardapio/components/cardapio_header_delegate.dart';
import 'package:clickped/screens/home/components/tabs/home/components/cardapio/components/home_tab_cardapio_dicas.dart';
import 'package:clickped/screens/home/components/tabs/home/components/cardapio/item_detalhe/item_detalhe.dart';
import 'package:clickped/shared/constants.dart';
import 'package:clickped/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomeTabCardapio extends StatelessWidget {
  @required final Comanda comanda;
  const HomeTabCardapio({
    Key key, this.comanda,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cardapio _cardapio = Cardapio.getCardapioFromDatabase(1);

    Size size = MediaQuery.of(context).size;

    List itemsLista() {
      List _itemsLista = List();

      for (int i = 0; i < _cardapio.categorias.length; i++) {
        _itemsLista.add([0, _cardapio.categorias[i].nome, i]);
        for (ItemCardapio item in _cardapio.items) {
          if (item.categorias.contains(_cardapio.categorias[i].id))
            _itemsLista.add([1, item]);
        }
      }

      return _itemsLista;
    }

    var _lista = itemsLista();

    AutoScrollController controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical,
        suggestedRowHeight: 400.0);

    Widget _wrapScrollTag({int index, Widget child}) => AutoScrollTag(
          key: ValueKey(index),
          controller: controller,
          index: index,
          child: child,
          highlightColor: Colors.black.withOpacity(0.1),
        );

    Future scrollToCategoria(int index) async {
      await controller.scrollToIndex(index,
          preferPosition: AutoScrollPosition.begin);
    }

    return CustomScrollView(
      controller: controller,
      slivers: <Widget>[
        SliverPersistentHeader(
            delegate: CardapioHeaderDelegate(maxExtent: 120.0, minExtent: 70.0, estabelecimento: comanda.estabelecimento),
            pinned: true),
        SliverPersistentHeader(
            delegate: CardapioCategoriasDelegate(
                maxExtent: 100.0,
                minExtent: 50.0,
                categorias: _cardapio.categorias,
                categoriaTap: scrollToCategoria),
            pinned: true),
        SliverList(
          delegate: SliverChildListDelegate([
            HomeTabCardapioDicas(cardapio: _cardapio.items, comanda: comanda,),
          ]),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: _lista[index][0] == 0
                  ? _wrapScrollTag(
                      index: _lista[index][2],
                      child: Container(
                          alignment: Alignment.centerLeft,
                          height: 50.0,
                          decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    width: .5, color: Colors.grey[300])),
                          ),
                          child: Text(
                            _lista[index][1],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: kPrimaryColor),
                          )),
                    )
                  : GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemDetalhe(
                                    itemCardapio: _lista[index][1],
                                    heroTag: '${_lista[index][1].nome}_$index',
                                comanda: comanda,
                                  ))),
                      child: Container(
                        height: 110.0,
                        width: size.width,
                        decoration: BoxDecoration(
                          //border: Border.symmetric(vertical: BorderSide(color: Colors.grey,),),
                          border: Border(
                              top: BorderSide(
                                  width: .5, color: Colors.grey[300])),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                        flex: 1,
                                        child: Text(
                                          _lista[index][1].nome,
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kAccentColor),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        fit: FlexFit.tight,
                                        child: Text(
                                          _lista[index][1].descricao,
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Text(
                                          getCurrencyText(_lista[index][1].preco),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Hero(
                                  tag: '${_lista[index][1].nome}_$index',
                                  child: Image(
                                    image:
                                        AssetImage(_lista[index][1].fotos[0]),
                                    width: 90.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            );
          }, childCount: _lista.length),
        ),
      ],
    );
  }
}
