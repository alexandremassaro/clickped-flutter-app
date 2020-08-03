class CategoriaCardapio {
  int id;
  String nome;

  CategoriaCardapio({ this.id, this.nome });

  static List<CategoriaCardapio> getCategoriasFromDatabase(int cardapioId) {
    List<CategoriaCardapio> _categorias = List<CategoriaCardapio>();

    _categorias.add(CategoriaCardapio(id: 1, nome: 'Pratos'));
    _categorias.add(CategoriaCardapio(id: 2, nome: 'Churrasco'));
    _categorias.add(CategoriaCardapio(id: 3, nome: 'Bebidas'));
    _categorias.add(CategoriaCardapio(id: 4, nome: 'Refrigerantes'));
    _categorias.add(CategoriaCardapio(id: 5, nome: 'Sanduíches'));
    _categorias.add(CategoriaCardapio(id: 6, nome: 'Porções'));
    _categorias.add(CategoriaCardapio(id: 7, nome: 'Filés'));
    _categorias.add(CategoriaCardapio(id: 8, nome: 'Cervejas'));
    _categorias.add(CategoriaCardapio(id: 9, nome: 'Hot Dog'));
    _categorias.add(CategoriaCardapio(id: 10, nome: 'Frango'));

    return _categorias;
  }

  static CategoriaCardapio getCategoriaFromDatabase(int id) {
    List<CategoriaCardapio> _categorias = List<CategoriaCardapio>();

    _categorias.add(CategoriaCardapio(id: 1, nome: 'Pratos'));
    _categorias.add(CategoriaCardapio(id: 2, nome: 'Churrasco'));
    _categorias.add(CategoriaCardapio(id: 3, nome: 'Bebidas'));
    _categorias.add(CategoriaCardapio(id: 4, nome: 'Refrigerantes'));
    _categorias.add(CategoriaCardapio(id: 5, nome: 'Sanduíches'));
    _categorias.add(CategoriaCardapio(id: 6, nome: 'Porções'));
    _categorias.add(CategoriaCardapio(id: 7, nome: 'Filés'));
    _categorias.add(CategoriaCardapio(id: 8, nome: 'Cervejas'));
    _categorias.add(CategoriaCardapio(id: 9, nome: 'Hot Dog'));
    _categorias.add(CategoriaCardapio(id: 10, nome: 'Frango'));

    for (CategoriaCardapio cat in _categorias)
      if (cat.id == id) return cat;

    return null;

  }

}