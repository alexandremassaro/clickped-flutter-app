class ItemCardapioOpcao {
  int min;
  int max;
  List<OpcaoItem> opcoes = List<OpcaoItem>();

  ItemCardapioOpcao({ this.min, this.max });

  void addOpcaoValues(String opcao, double valor) {
    opcoes.add(OpcaoItem(opcao: opcao, valor: valor));
  }

  void addOpcao(OpcaoItem opcao) {
    opcoes.add(opcao);
  }

  bool removeOpcaoAt(int index) {
    return opcoes.removeAt(index) != null;
  }

  bool removeOpcao(OpcaoItem opcao) {
    return opcoes.remove(opcao);
  }

  bool removeOpcaoStr(String opcao) {
    for (OpcaoItem op in opcoes)
      if (op.toString() == opcao)
        return opcoes.remove(op);

    return false;

  }
}

class OpcaoItem {
  double valor;
  String opcao;
  bool selected = false;

  OpcaoItem({ this.opcao, this.valor });

  @override
  String toString() {
    return this.opcao;
  }
}