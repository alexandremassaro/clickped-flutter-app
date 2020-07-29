import 'package:clickped/models/item_cardapio_opcao.dart';

class ItemCardapio {
  String uid;
  String nome;
  String descricao;
  var categorias = List();
  double preco;
  var fotos = List();
  List<ItemCardapioOpcao> opcoes = List<ItemCardapioOpcao>();

  ItemCardapio({ this.uid, this.nome, this.descricao, this.categorias, this.preco, this.fotos, this.opcoes });

}