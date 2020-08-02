import 'package:clickped/models/pedido.dart';

class Comanda {
  final DateTime dataChegada;
  DateTime dataSaida;
  List<Pedido> pedidos = List<Pedido>();
  bool pago = false;

  Comanda(this.dataChegada);

  double getTotal() {
    double _total = 0.0;
    for (Pedido item in pedidos) {
      _total += item.getTotal();
    }
    return _total;
  }
}