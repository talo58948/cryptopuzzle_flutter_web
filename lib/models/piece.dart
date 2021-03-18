import 'package:flutter/material.dart' show required, ImageProvider, AssetImage;
import 'user.dart';

class Piece {
  final ImageProvider image;
  final User owner;
  final bool owned;
  static const Piece dflt = Piece(
      image: AssetImage('images/dfltPuzzlePiece.png'),
      owner: User.dflt,
      owned: true);
  const Piece(
      {@required this.image, @required this.owner, @required this.owned});
}
