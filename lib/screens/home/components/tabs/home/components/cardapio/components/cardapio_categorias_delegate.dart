import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show FloatingHeaderSnapConfiguration, OverScrollHeaderStretchConfiguration;

class CardapioCategoriasDelegate implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;
  final categorias;
  final Function categoriaTap;

  CardapioCategoriasDelegate({this.minExtent, this.maxExtent, this.categorias, this.categoriaTap});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return shrinkOffset == 100
        ? Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.symmetric(
                  vertical: BorderSide(color: Colors.grey[300])),
            ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, right: index==categorias.length-1 ? 20.0 : 0),
                      child: GestureDetector(
                        onTap: () async {
                          return categoriaTap(index);
                        },
                        child: Text(categorias[index].nome,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor)),
                      ),
                    ),
                  );
                }),
          )
        : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.symmetric(
                  vertical: BorderSide(color: Colors.grey[300])),
            ),
            child: Center(
                child: Text(
              'Consumo Atual: R\$ 200,00',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: kSecondaryColor),
            )),
          );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  // implement snapConfiguration
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  // implement stretchConfiguration
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;


}
