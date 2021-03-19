import 'package:flutter/material.dart' show required;
import 'piece.dart';

class Puzzle {
  final List<Piece> puzzlePieces;
  final int numberOfPieces;
  final String id;
  final double ratio;
  static const Puzzle dflt = Puzzle(
    puzzlePieces: [
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
    ],
    numberOfPieces: 9,
    id: '#1524',
    ratio: 1.0,
  );
  static const Puzzle dflt2 = Puzzle(
    puzzlePieces: [
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
      Piece.dflt,
    ],
    numberOfPieces: 16,
    id: '#1655',
    ratio: 1.0,
  );
  const Puzzle({
    @required this.puzzlePieces,
    @required this.numberOfPieces,
    @required this.id,
    this.ratio,
  });
}
