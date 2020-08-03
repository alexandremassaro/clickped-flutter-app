import 'dart:math';
import 'package:clickped/models/estabelecimento.dart';
import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show FloatingHeaderSnapConfiguration, OverScrollHeaderStretchConfiguration;

class CardapioHeaderDelegate implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;
  final Estabelecimento estabelecimento;

  CardapioHeaderDelegate({this.minExtent, this.maxExtent, this.estabelecimento});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: Colors.white,
//          width: double.infinity,
//          height: minExtent,
//          decoration: BoxDecoration(
//            border: Border.symmetric(vertical: BorderSide(color: Colors.grey)), color: Colors.white,
//          ),
          child: SafeArea(
            child: Center(
                child: Text(
                  estabelecimento.nome,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: kSecondaryColor),
                )),
          ),
        ),

        Image(
          image: AssetImage(estabelecimento.foto),
          fit: BoxFit.fitWidth,
          color: Colors.grey.withOpacity(imageOpacity(shrinkOffset)),
          colorBlendMode: BlendMode.modulate,
        ),

      ],
    );
  }

  double imageOpacity(double offSet) {
    return 1.0 - max(0.0, offSet) / maxExtent;
  }

  double textOpacity(double offSet) {
    return 0.0 + min(0.0, offSet) / maxExtent;
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
