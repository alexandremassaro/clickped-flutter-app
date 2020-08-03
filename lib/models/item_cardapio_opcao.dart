class ItemCardapioOpcao {
  final int id;
  final int min;
  final int max;
  final int itemCardapioId;
  final List<OpcaoItem> opcoes;

  ItemCardapioOpcao({this.id, this.min, this.max, this.itemCardapioId, this.opcoes});

  static List<ItemCardapioOpcao> getOpcoesFromDatabase(int itemCardapioId) {
    List<ItemCardapioOpcao> _allOpcoes = List<ItemCardapioOpcao>();

    _allOpcoes.add(ItemCardapioOpcao(id: 1, min: 1, max: 1, itemCardapioId: 16, opcoes: OpcaoItem.getItensFromDatabase(1)));
    _allOpcoes.add(ItemCardapioOpcao(id: 2, min: 0, max: 1, itemCardapioId: 16, opcoes: OpcaoItem.getItensFromDatabase(2)));
    _allOpcoes.add(ItemCardapioOpcao(id: 3, min: 0, max: 2, itemCardapioId: 16, opcoes: OpcaoItem.getItensFromDatabase(3)));
    _allOpcoes.add(ItemCardapioOpcao(id: 4, min: 1, max: 2, itemCardapioId: 16, opcoes: OpcaoItem.getItensFromDatabase(4)));

    List<ItemCardapioOpcao> _opcoes = List<ItemCardapioOpcao>();

    for (ItemCardapioOpcao op in _allOpcoes)
      if (op.itemCardapioId == itemCardapioId) _opcoes.add(op);

    return _opcoes;
  }
}

class OpcaoItem {
  final int id;
  final int opcaoId;
  final double valor;
  final String nome;
  bool selected = false;

  OpcaoItem({ this.id, this.opcaoId, this.valor, this.nome });

  static List<OpcaoItem> getItensFromDatabase(int opcaoId) {
    List<OpcaoItem> _allItens = List<OpcaoItem>();

    _allItens.add(OpcaoItem(id: 1, nome: 'Fraldinha na mostarda', valor: 0.0, opcaoId: 1));
    _allItens.add(OpcaoItem(id: 2, nome: 'Costelinha de porco no mel', valor: 0.0, opcaoId: 1));
    _allItens.add(OpcaoItem(id: 3, nome: 'Lombo de porco no mel', valor: 0.0, opcaoId: 1));
    _allItens.add(OpcaoItem(id: 4, nome: 'Filé de frango com queijo', valor: 0.0, opcaoId: 1));

    _allItens.add(OpcaoItem(id: 5, nome: 'Arroz branco', valor: 0.0, opcaoId: 2));
    _allItens.add(OpcaoItem(id: 6, nome: 'Arroz temperado', valor: 0.0, opcaoId: 2));
    _allItens.add(OpcaoItem(id: 7, nome: 'Arroz integral', valor: 0.0, opcaoId: 2));
    _allItens.add(OpcaoItem(id: 8, nome: 'Arroz parbolizado', valor: 0.0, opcaoId: 2));

    _allItens.add(OpcaoItem(id: 9, nome: 'Molho verde', valor: 1.0, opcaoId: 3));
    _allItens.add(OpcaoItem(id: 10, nome: 'Maionese da casa', valor: 1.0, opcaoId: 3));
    _allItens.add(OpcaoItem(id: 11, nome: 'Maionese comum', valor: 1.0, opcaoId: 3));

    _allItens.add(OpcaoItem(id: 12, nome: 'Vinagrete', valor: 5.0, opcaoId: 4));
    _allItens.add(OpcaoItem(id: 13, nome: 'Salada de alface', valor: 5.0, opcaoId: 4));

    List<OpcaoItem> _itens = List<OpcaoItem>();

    for (OpcaoItem op in _allItens)
      if (op.opcaoId == opcaoId) _itens.add(op);

    return _itens;

  }

  @override
  String toString() {
    return this.nome;
  }
}