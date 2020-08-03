import 'package:clickped/models/estabelecimento.dart';
import 'package:clickped/models/pedido.dart';

class Comanda {
  final int id;
  final DateTime dataChegada;
  final String usuarioUid;
  DateTime dataSaida;
  List<Pedido> pedidos = List<Pedido>();
  bool pago = false;
  final Estabelecimento estabelecimento;

  Comanda({this.id, this.dataChegada, this.estabelecimento, this.usuarioUid});

  double getTotal() {
    double _total = 0.0;
    for (Pedido item in pedidos) {
      _total += item.getTotal();
    }
    return _total;
  }

  static List<Comanda> getAllComandasFromDatabase() {
    List<Comanda> _comandas = List<Comanda>();
    // TODO: Implement getAllComandasFromDatabase
    Comanda comanda = Comanda(estabelecimento: Estabelecimento.getEstabecimentoFromDatabase(1), dataChegada: DateTime.now().subtract(Duration(days: 2)), usuarioUid: '1234567890');
    comanda.pedidos = Pedido.getPedidosFromDatabase(1);
    comanda.pago = true;
    _comandas.add(comanda);
    comanda = Comanda(estabelecimento: Estabelecimento.getEstabecimentoFromDatabase(1), dataChegada: DateTime.now().subtract(Duration(days: 2)), usuarioUid: '1234567890');
    comanda.pedidos = Pedido.getPedidosFromDatabase(1);
    comanda.pago = true;
    _comandas.add(comanda);
    comanda = Comanda(estabelecimento: Estabelecimento.getEstabecimentoFromDatabase(1), dataChegada: DateTime.now().subtract(Duration(days: 5)), usuarioUid: '1234567890');
    comanda.pedidos = Pedido.getPedidosFromDatabase(1);
    comanda.pago = true;
    _comandas.add(comanda);
    comanda = Comanda(estabelecimento: Estabelecimento.getEstabecimentoFromDatabase(1), dataChegada: DateTime.now().subtract(Duration(days: 7)), usuarioUid: '1234567890');
    comanda.pedidos = Pedido.getPedidosFromDatabase(1);
    comanda.pago = true;
    _comandas.add(comanda);
    comanda = Comanda(estabelecimento: Estabelecimento.getEstabecimentoFromDatabase(1), dataChegada: DateTime.now().subtract(Duration(days: 9)), usuarioUid: '1234567890');
    comanda.pedidos = Pedido.getPedidosFromDatabase(1);
    comanda.pago = true;
    _comandas.add(comanda);
    comanda = Comanda(estabelecimento: Estabelecimento.getEstabecimentoFromDatabase(1), dataChegada: DateTime.now().subtract(Duration(days: 15)), usuarioUid: '1234567890');
    comanda.pedidos = Pedido.getPedidosFromDatabase(1);
    comanda.pago = true;
    _comandas.add(comanda);
    comanda = Comanda(estabelecimento: Estabelecimento.getEstabecimentoFromDatabase(1), dataChegada: DateTime.now().subtract(Duration(days: 22)), usuarioUid: '1234567890');
    comanda.pedidos = Pedido.getPedidosFromDatabase(1);
    comanda.pago = true;
    _comandas.add(comanda);

    return _comandas;
  }
}