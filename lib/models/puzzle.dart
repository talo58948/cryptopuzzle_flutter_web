import 'package:flutter/material.dart' show required;
import 'piece.dart';

class Puzzle {
  final List<Piece> puzzlePieces;
  final int numberOfPieces;
  static const Puzzle dflt = Puzzle(puzzlePieces: [
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
  const Puzzle({@required this.puzzlePieces, @required this.numberOfPieces});
}
