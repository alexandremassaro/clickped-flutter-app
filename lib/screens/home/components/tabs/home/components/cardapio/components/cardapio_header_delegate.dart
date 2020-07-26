import 'dart:math';

import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

class CardapioHeaderDelegate implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;

  CardapioHeaderDelegate({this.minExtent, this.maxExtent});

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
                  'Nome do Restaurante',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: kSecondaryColor),
                )),
          ),
        ),

        Image(
          image: AssetImage('assets/images/banner1.jpg'),
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

//  @override
//  // TODO: implement maxExtent
//  double get maxExtent => throw UnimplementedError();
//
//  @override
//  // TODO: implement minExtent
//  double get minExtent => throw UnimplementedError();

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}
