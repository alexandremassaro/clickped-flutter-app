import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';

class FormasPagamento extends StatefulWidget {
  @override
  _FormasPagamentoState createState() => _FormasPagamentoState();
}

class _FormasPagamentoState extends State<FormasPagamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Formas de pagamento'),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {  },
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: ((context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.credit_card, size: 40.0,),
              title: Text('Cartão de crédito'),
              subtitle: Text('MasterCard ****1523'),
              trailing: index == 1 ? Icon(Icons.check_circle_outline, color: kAccentColor,) : null,
              onTap: () {},
            ),
          );
      })),
    );
  }
}
