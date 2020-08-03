import 'package:intl/intl.dart';

String getCurrencyText(double valor) {
  return valor != null ? NumberFormat.simpleCurrency(locale: 'pt_BR').format(valor) : 'Não disponível';
}

String getDateTimeText(DateTime date) {
  return date != null ? DateFormat('dd/MM/yyyy').add_Hm().format(date) : 'Não disponível';
}

String getDateText(DateTime date) {
  return date != null ? DateFormat('dd/MM/yyyy').format(date) : 'Não disponível';
}