import 'package:clickped/models/cardapio.dart';

class Estabelecimento {
  final int id;
  final String nome;
  final Cardapio cardapio;
  final String foto;

  Estabelecimento({this.id, this.nome, this.cardapio, this.foto});

  static Estabelecimento getEstabecimentoFromDatabase(int id) {
    return Estabelecimento(
      id: id,
      nome: 'Bar do Pepe',
      cardapio: Cardapio.getCardapioFromDatabase(1),
      foto: 'assets/images/banner1.jpg'
    );
  }

}