import 'package:flutter/material.dart' show required;
import 'piece.dart';

class Puzzle {
  final List<Piece> puzzlePieces;
  final int numberOfPieces;
  final String id;
  final String name;
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
    name: 'dflt1',
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
    name: 'dflt2',
    ratio: 1.0,
  );
  const Puzzle({
    @required this.puzzlePieces,
    @required this.numberOfPieces,
    @required this.id,
    @required this.name,
    this.ratio = 1.0,
  });
}
