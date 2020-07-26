import 'package:clickped/models/categoria_cardapio.dart';
import 'package:clickped/models/item_cardapio.dart';
import 'package:clickped/screens/home/components/tabs/home/components/cardapio/components/cardapio_categorias_delegate.dart';
import 'package:clickped/screens/home/components/tabs/home/components/cardapio/components/cardapio_header_delegate.dart';
import 'package:clickped/screens/home/components/tabs/home/components/cardapio/components/home_tab_cardapio_dicas.dart';
import 'package:clickped/screens/home/components/tabs/home/components/cardapio/item_detalhe/item_detalhe.dart';
import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomeTabCardapio extends StatelessWidget {
  const HomeTabCardapio({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var _cardapio = [
      ItemCardapio(
          uid: '1',
          nome: 'Big Mac',
          categorias: ['Sanduíches'],
          descricao: 'Lanche',
          fotos: ['assets/images/banner1.jpg'],
          preco: 35.0),
      ItemCardapio(
          uid: '2',
          nome: 'Frango duplo',
          categorias: ['Hot Dog'],
          descricao: 'Lanche',
          fotos: ['assets/images/banner1.jpg'],
          preco: 15.0),
      ItemCardapio(
          uid: '3',
          nome: 'Heineken 600ml',
          categorias: ['Bebidas', 'Cervejas'],
          descricao: 'Cerveja',
          fotos: ['assets/images/banner1.jpg'],
          preco: 15.0),
      ItemCardapio(
          uid: '4',
          nome: 'Heineken LongNeck',
          categorias: ['Bebidas', 'Cervejas'],
          descricao: 'Cerveja',
          fotos: ['assets/images/banner1.jpg'],
          preco: 8.0),
      ItemCardapio(
          uid: '5',
          nome: 'Filé à parmegiana',
          categorias: ['Pratos', 'Filés'],
          descricao: 'Filé a parmegiana',
          fotos: ['assets/images/banner1.jpg'],
          preco: 27.0),
      ItemCardapio(
          uid: '6',
          nome: 'Batata frita',
          categorias: ['Porções'],
          descricao: 'Porção de Batata frita',
          fotos: ['assets/images/banner1.jpg'],
          preco: 12.0),
      ItemCardapio(
          uid: '7',
          nome: 'Calabresa acebolada',
          categorias: ['Porções'],
          descricao: 'Porção de calabresa acebolada',
          fotos: ['assets/images/banner1.jpg'],
          preco: 14.0),
      ItemCardapio(
          uid: '8',
          nome: 'Calabresa acebolada',
          categorias: ['Porções'],
          descricao: 'Porção de calabresa acebolada',
          fotos: ['assets/images/banner1.jpg'],
          preco: 14.0),
      ItemCardapio(
          uid: '9',
          nome: 'MacLanche Feliz',
          categorias: ['Sanduíches'],
          descricao: 'Lanche',
          fotos: ['assets/images/banner1.jpg'],
          preco: 99.0),
      ItemCardapio(
          uid: '10',
          nome: 'Coca-Cola 600ml',
          categorias: ['Bebidas', 'Refrigerantes'],
          descricao: 'Refrigerante',
          fotos: ['assets/images/banner1.jpg'],
          preco: 9.0),
      ItemCardapio(
          uid: '11',
          nome: 'Coca-Cola Lata',
          categorias: ['Bebidas', 'Refrigerantes'],
          descricao: 'Refrigerante',
          fotos: ['assets/images/banner1.jpg'],
          preco: 7.0),
      ItemCardapio(
          uid: '12',
          nome: 'Coca-Cola 2 litros',
          categorias: ['Bebidas', 'Refrigerantes'],
          descricao: 'Refrigerante',
          fotos: ['assets/images/banner1.jpg'],
          preco: 12.0),
      ItemCardapio(
          uid: '13',
          nome: 'Picanha no alho',
          categorias: ['Pratos', 'Churrasco'],
          descricao: 'Picanha no alho',
          fotos: ['assets/images/banner1.jpg'],
          preco: 42.0),
      ItemCardapio(
          uid: '14',
          nome:
              'Combo individual- porção individual de frango frito + batata frita ou polenta + coca mini pet 200ml',
          categorias: ['Pratos', 'Frango'],
          descricao:
              'Porção grande de frango frito 300g(in natura) +batata frita ou polenta (150g in natura) + coca mini pet 200ml acompanha 1 molho grátis (mostarda)',
          fotos: ['assets/images/banner1.jpg'],
          preco: 39.0),
      ItemCardapio(
          uid: '15',
          nome: 'Costela assada',
          categorias: ['Pratos', 'Churrasco'],
          descricao: 'Costela assada',
          fotos: ['assets/images/banner1.jpg'],
          preco: 39.0),
    ];

    var _categorias = [
      CategoriaCardapio(uid: '1', nome: 'Pratos'),
      CategoriaCardapio(uid: '2', nome: 'Churrasco'),
      CategoriaCardapio(uid: '3', nome: 'Bebidas'),
      CategoriaCardapio(uid: '4', nome: 'Refrigerantes'),
      CategoriaCardapio(uid: '5', nome: 'Sanduíches'),
      CategoriaCardapio(uid: '6', nome: 'Porções'),
      CategoriaCardapio(uid: '7', nome: 'Filés'),
      CategoriaCardapio(uid: '8', nome: 'Cervejas'),
      CategoriaCardapio(uid: '9', nome: 'Hot Dog'),
      CategoriaCardapio(uid: '10', nome: 'Frango'),
    ];

    List itemsLista() {
      var _itemsLista = [];

      for (int i = 0; i < _categorias.length; i++) {
        _itemsLista.add([0, _categorias[i].nome, i]);
        for (var item in _cardapio) {
          if (item.categorias.contains(_categorias[i].nome))
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
            delegate: CardapioHeaderDelegate(maxExtent: 120.0, minExtent: 70.0),
            pinned: true),
        SliverPersistentHeader(
            delegate: CardapioCategoriasDelegate(
                maxExtent: 100.0,
                minExtent: 50.0,
                categorias: _categorias,
                categoriaTap: scrollToCategoria),
            pinned: true),
        SliverList(
          delegate: SliverChildListDelegate([
            HomeTabCardapioDicas(cardapio: _cardapio),
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
                                          NumberFormat.simpleCurrency(
                                                  locale: 'pt_BR')
                                              .format(_lista[index][1].preco),
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
                                child: Image(
                                  image: AssetImage(_lista[index][1].fotos[0]),
                                  width: 90.0,
                                  fit: BoxFit.cover,
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
