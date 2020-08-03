import 'package:clickped/models/item_cardapio.dart';
import 'package:clickped/models/item_cardapio_opcao.dart';

class Pedido {
  final int id;
  final int comandaId;
  final ItemCardapio item;
  final int quantidade;
  final DateTime dataPedido;
  final String observacao;
  DateTime lastStatusChange;
  int status;

  Pedido({ this.id, this.comandaId, this.item, this.quantidade, this.dataPedido, this.observacao }) {
    this.lastStatusChange = this.dataPedido;
    this.status = 1;
  }

  double getValorUnitario() {
    double _total = item.preco;
    for (ItemCardapioOpcao opcionais in item.opcoes)
      for (OpcaoItem opcao in opcionais.opcoes)
        if (opcao.selected)
          _total += opcao.valor;

    return _total;
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

  static List<Pedido> getPedidosFromDatabase(int idComanda){
    List<Pedido> pedidos = List<Pedido>();
    pedidos.add(Pedido(id: 1, comandaId: idComanda, quantidade: 1, observacao: '', dataPedido: DateTime.now(), item: ItemCardapio.getItensCardapioFromDatabase(1)[0]));
    pedidos.add(Pedido(id: 2, comandaId: idComanda, quantidade: 1, observacao: '', dataPedido: DateTime.now(), item: ItemCardapio.getItensCardapioFromDatabase(1)[1]));
    pedidos.add(Pedido(id: 3, comandaId: idComanda, quantidade: 1, observacao: '', dataPedido: DateTime.now(), item: ItemCardapio.getItensCardapioFromDatabase(1)[2]));
    pedidos.add(Pedido(id: 4, comandaId: idComanda, quantidade: 1, observacao: '', dataPedido: DateTime.now(), item: ItemCardapio.getItensCardapioFromDatabase(1)[3]));
    return pedidos;
  }

}