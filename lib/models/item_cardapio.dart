import 'package:clickped/models/item_cardapio_opcao.dart';

class ItemCardapio {
  final int id;
  final String nome;
  final String descricao;
  final List<int> categorias;
  final double preco;
  final List<String> fotos;
  final List<ItemCardapioOpcao> opcoes;

  ItemCardapio({ this.id, this.nome, this.descricao, this.categorias, this.preco, this.fotos, this.opcoes });

  static List<ItemCardapio> getItensCardapioFromDatabase(int cardapioId) {
    List<ItemCardapio> _itens = List<ItemCardapio>();

    _itens.add(
        ItemCardapio(
          id: 1,
          nome: 'Big Mac',
          categorias: [4],
          descricao: 'Lanche',
          fotos: ['assets/images/banner1.jpg'],
          preco: 35.0,
          opcoes: List<ItemCardapioOpcao>()
        )
    );

    _itens.add(
      ItemCardapio(
        id: 2,
        nome: 'Frango duplo',
        categorias: [9],
        descricao: 'Lanche',
        fotos: ['assets/images/banner1.jpg'],
        preco: 15.0,
        opcoes: List<ItemCardapioOpcao>()
      ),
    );

    _itens.add(
      ItemCardapio(
        id: 3,
        nome: 'Heineken 600ml',
        categorias: [3, 8],
        descricao: 'Cerveja',
        fotos: ['assets/images/banner1.jpg'],
        preco: 15.0,
        opcoes: List<ItemCardapioOpcao>()
      )
    );

    _itens.add(
      ItemCardapio(
        id: 4,
        nome: 'Heineken LongNeck',
        categorias: [3, 8],
        descricao: 'Cerveja',
        fotos: ['assets/images/banner1.jpg'],
        preco: 8.0,
        opcoes: List<ItemCardapioOpcao>()
      )
    );

    _itens.add(
      ItemCardapio(
        id: 5,
        nome: 'Filé à parmegiana',
        categorias: [1, 7],
        descricao: 'Filé a parmegiana',
        fotos: ['assets/images/banner1.jpg'],
        preco: 27.0,
        opcoes: List<ItemCardapioOpcao>()
      )
    );

    _itens.add(
      ItemCardapio(
        id: 6,
        nome: 'Batata frita',
        categorias: [6],
        descricao: 'Porção de Batata frita',
        fotos: ['assets/images/banner1.jpg'],
        preco: 12.0,
        opcoes: List<ItemCardapioOpcao>()
      ),
    );

    _itens.add(
      ItemCardapio(
        id: 7,
        nome: 'Calabresa acebolada',
        categorias: [6],
        descricao: 'Porção de calabresa acebolada',
        fotos: ['assets/images/banner1.jpg'],
        preco: 14.0,
        opcoes: List<ItemCardapioOpcao>()
      ),
    );

    _itens.add(
      ItemCardapio(
        id: 8,
        nome: 'Calabresa acebolada',
        categorias: [6],
        descricao: 'Porção de calabresa acebolada',
        fotos: ['assets/images/banner1.jpg'],
        preco: 14.0,
        opcoes: List<ItemCardapioOpcao>()
      )
    );

    _itens.add(
      ItemCardapio(
        id: 9,
        nome: 'MacLanche Feliz',
        categorias: [5],
        descricao: 'Lanche',
        fotos: ['assets/images/banner1.jpg'],
        preco: 99.0,
        opcoes: List<ItemCardapioOpcao>()
      )
    );

    _itens.add(
      ItemCardapio(
        id: 10,
        nome: 'Coca-Cola 600ml',
        categorias: [3, 4],
        descricao: 'Refrigerante',
        fotos: ['assets/images/banner1.jpg'],
        preco: 9.0,
        opcoes: List<ItemCardapioOpcao>()
      )
    );

    _itens.add(
      ItemCardapio(
        id: 11,
        nome: 'Coca-Cola Lata',
        categorias: [3, 4],
        descricao: 'Refrigerante',
        fotos: ['assets/images/banner1.jpg'],
        preco: 7.0,
        opcoes: List<ItemCardapioOpcao>()
      ),
    );

    _itens.add(
      ItemCardapio(
        id: 12,
        nome: 'Coca-Cola 2 litros',
        categorias: [3, 4],
        descricao: 'Refrigerante',
        fotos: ['assets/images/banner1.jpg'],
        preco: 12.0,
        opcoes: List<ItemCardapioOpcao>()
      )
    );

    _itens.add(
      ItemCardapio(
        id: 13,
        nome: 'Picanha no alho',
        categorias: [1, 2],
        descricao: 'Picanha no alho',
        fotos: ['assets/images/banner1.jpg'],
        preco: 42.0,
        opcoes: List<ItemCardapioOpcao>()
      )
    );

    _itens.add(
      ItemCardapio(
        id: 14,
        nome:
        'Combo individual- porção individual de frango frito + batata frita ou polenta + coca mini pet 200ml',
        categorias: [1, 10],
        descricao:
        'Porção grande de frango frito 300g(in natura) +batata frita ou polenta (150g in natura) + coca mini pet 200ml acompanha 1 molho grátis (mostarda)',
        fotos: ['assets/images/banner1.jpg'],
        preco: 39.0,
        opcoes: List<ItemCardapioOpcao>()
      )
    );

    _itens.add(
      ItemCardapio(
        id: 15,
        nome: 'Costela assada',
        categorias: [1, 2],
        descricao: 'Costela assada',
        fotos: ['assets/images/banner1.jpg'],
        preco: 39.0,
        opcoes: List<ItemCardapioOpcao>()
      )
    );

    _itens.add(
      ItemCardapio(
        id: 16,
        nome: 'Kit Churrasco',
        categorias: [1,2],
        descricao:
        'Costela assada gde, 1 porção inteira de carne da preferência, 1 salada de tomate, linguicinha assada, 1 porção de mandioca cozida, arroz grande, 2 pães de alho, 1 coca 2 litros, serve 6 pessoas',
        fotos: ['assets/images/banner1.jpg'],
        preco: 219.9,
        opcoes: ItemCardapioOpcao.getOpcoesFromDatabase(16)
      )
    );
    return _itens;
  }

}