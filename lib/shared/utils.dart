import 'package:intl/intl.dart';

String getCurrencyText(double valor) {
  return NumberFormat.simpleCurrency(locale: 'pt_BR').format(valor);
}

String getDateTimeText(DateTime date) {
  return DateFormat('dd/MM/yyyy').add_Hm().format(date);
}

String getDateText(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date);
}