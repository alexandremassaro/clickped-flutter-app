import 'package:clickped/models/comanda.dart';
import 'package:clickped/screens/home/components/tabs/comandas/components/page_historico/components/historico_detalhe.dart';
import 'package:clickped/shared/constants.dart';
import 'package:clickped/shared/utils.dart';
import 'package:flutter/material.dart';

class ComandaHistorico extends StatefulWidget {
  @override
  _ComandaHistoricoState createState() => _ComandaHistoricoState();
}

class _ComandaHistoricoState extends State<ComandaHistorico> {
  List<Comanda> _historico = Comanda.getAllComandasFromDatabase();
  
  List _historicoDatas() {

    if (_historico.isEmpty)
      return [];

    var _listaDatas = [];
    DateTime _lastDate = _historico[0].dataChegada;
    _listaDatas.add(_historico[0].dataChegada);
    for (Comanda comanda in _historico) {
      if(comanda.dataChegada.difference(_lastDate).inDays != 0)
        _listaDatas.add(comanda.dataChegada);
    }

    return _listaDatas;
  }

  @override
  Widget build(BuildContext context) {
    var _datas = _historicoDatas();

    return _historico.isEmpty ? Text('Ainda não existe nenhuma comanda em seu histórico') : ListView.builder(
        itemCount: _datas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                //color: Colors.grey[200],
                  color: kPrimaryColor.withAlpha(50),
                border: Border.all(color: kPrimaryColor.withAlpha(10),),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      getDateText(_datas[index]),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  for (Comanda comanda in _historico)
                    if(comanda.dataChegada.difference(_datas[index]).inDays == 0)
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          leading: Hero(
                            tag: comanda.dataChegada,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(comanda.estabelecimento.foto),
                            ),
                          ),
                          title: Text(
                            comanda.estabelecimento.nome,
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          subtitle: Text(getCurrencyText(comanda.getTotal())),
                          trailing: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricoDetalhe(comanda: comanda)));
                            },
                          ),
                        ),
                      ),
                ],
              ),
            ),
          );
        });
  }
}
