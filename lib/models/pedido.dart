import 'package:clickped/models/item_cardapio.dart';
import 'package:clickped/models/item_cardapio_opcao.dart';

class Pedido {
  final ItemCardapio item;
  final int quantidade;
  final DateTime dataPedido;
  DateTime lastStatusChange;
  int status;

  Pedido({ this.item, this.quantidade, this.dataPedido }) {
    this.lastStatusChange = this.dataPedido;
    this.status = 1;
  }

  double getTotal() {
    double _total = item.preco;
    for (ItemCardapioOpcao opcionais in item.opcoes)
      for (OpcaoItem opcao in opcionais.opcoes)
        if (opcao.selected)
          _total += opcao.valor;

    _total *= quantidade;

    return _total;
  }

}