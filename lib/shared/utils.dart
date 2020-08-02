import 'package:intl/intl.dart';

String getCurrencyText(double valor) {
  return NumberFormat.simpleCurrency(locale: 'pt_BR').format(valor);
}