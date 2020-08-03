import 'package:clickped/models/categoria_cardapio.dart';
import 'package:clickped/models/item_cardapio.dart';

class Cardapio {
  final int id;
  final List<ItemCardapio> items;
  final List<CategoriaCardapio> categorias;

  Cardapio({this.id, this.items, this.categorias});

  static Cardapio getCardapioFromDatabase(int id) {
    return Cardapio(id: id, categorias: CategoriaCardapio.getCategoriasFromDatabase(id), items: ItemCardapio.getItensCardapioFromDatabase(id));
  }

}