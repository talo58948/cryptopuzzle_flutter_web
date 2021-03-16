import 'package:flutter/material.dart' show required;
import 'piece.dart';

class Puzzle {
  List<Piece> puzzlePieces;
  int numberOfPieces;
  static final Puzzle dflt = Puzzle(puzzlePieces: [
    Piece.dflt,
    Piece.dflt,
    Piece.dflt,
    Piece.dflt,
    Piece.dflt,
    Piece.dflt,
    Piece.dflt,
    Piece.dflt,
    Piece.dflt,
  ], numberOfPieces: 9);
  Puzzle({@required this.puzzlePieces, @required this.numberOfPieces});
}
