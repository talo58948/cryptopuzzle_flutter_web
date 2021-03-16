import 'package:flutter/material.dart' show required, Image;
import 'user.dart';

class Piece {
  Image image;
  User owner;
  bool owned;
  static final Piece dflt =
      Piece(image: Image.asset('black.png'), owner: User.dflt, owned: true);
  Piece({@required this.image, @required this.owner, @required this.owned});
}
