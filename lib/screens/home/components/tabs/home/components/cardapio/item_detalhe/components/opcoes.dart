import 'package:clickped/models/item_cardapio_opcao.dart';
import 'package:clickped/shared/constants.dart';
import 'package:clickped/shared/utils.dart';
import 'package:flutter/material.dart';

class Opcoes extends StatefulWidget {
  final ItemCardapioOpcao opcao;

  const Opcoes({
    Key key,
    this.opcao,
  }) : super(key: key);

  @override
  _OpcoesState createState() => _OpcoesState();
}

class _OpcoesState extends State<Opcoes> {
  bool isOptional() {
    return widget.opcao.min == 0;
  }

  bool isRadio() {
    return widget.opcao.max == 1;
  }

  setSelected() {
    if (_selected != null)
      widget.opcao.opcoes[widget.opcao.opcoes.indexOf(_selected)].selected =
          true;
  }

  bool toggleSelection(OpcaoItem op, bool val) {
    if (val && qtdSelected < widget.opcao.max) {
      setState(() {
        op.selected = val;
        qtdSelected += 1;
      });
    } else if (!val)
      setState(() {
        op.selected = val;
        qtdSelected -= 1;
      });

    return op.selected;
  }

  OpcaoItem _selected;
  int qtdSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: kPrimaryColor.withAlpha(30))),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0)),
              child: Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor.withAlpha(30),
                    border: Border(
                        bottom:
                            BorderSide(color: kPrimaryColor.withAlpha(30)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                          child: Text(
                            'Escolha uma opção',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                          child: Text('0 de ${widget.opcao.max}'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            isOptional() ? 'OPCIONAL' : 'OBRIGATÓRIO',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            for (OpcaoItem op in widget.opcao.opcoes)
              ListTile(
                title: Text(op.valor == 0.0
                    ? op.nome
                    : '${op.nome} - ${getCurrencyText(op.valor)}'),
                trailing: isRadio()
                    ? Radio(
                        activeColor: kAccentColor,
                        value: op,
                        groupValue: _selected,
                        onChanged: (OpcaoItem val) {
                          setState(() {
                            if (_selected != null) _selected.selected = false;
                            _selected = val;
                            _selected.selected = true;
                          });
                        },
                      )
                    : Checkbox(
                        value: op.selected,
                        activeColor: kAccentColor,
                        onChanged: (bool val) => setState(
                            () => op.selected = toggleSelection(op, val))),
              ),
          ],
        ),
      ),
    );
  }
}
