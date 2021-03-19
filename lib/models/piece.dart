import 'package:flutter/material.dart' show required, ImageProvider, AssetImage;
import 'user.dart';

class Piece {
  final ImageProvider image;
  final User owner;
  final bool owned;
  final double ratio;
  final Rarity rarity;
  static const Piece dflt = Piece(
    image: AssetImage('images/piece2.png'),
    owner: User.dflt,
    owned: false,
    ratio: 1.0,
    rarity: Rarity.rare,
  );
  const Piece({
    @required this.image,
    @required this.owner,
    @required this.owned,
    this.ratio,
    @required this.rarity,
  });
}

enum Rarity { common, rare, legendary }
