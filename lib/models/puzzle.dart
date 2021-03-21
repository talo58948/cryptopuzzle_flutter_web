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
  static List<Puzzle> getPuzzles(List<Piece> ps) {
    List<Piece> pieces = [];
    ps.forEach((piece) {
      pieces.add(piece);
    });
    List<Puzzle> puzzles = [];

    while (pieces.isNotEmpty) {
      List<Piece> puzzlePieces = _getPuzzlePieces(pieces);
      _sortPuzzlePieces(puzzlePieces);
      puzzles.add(Puzzle(
        puzzlePieces: puzzlePieces,
        id: puzzlePieces[0].puzzleId,
        name: puzzlePieces[0].puzzleName,
        numberOfPieces: puzzlePieces.length,
        ratio: puzzlePieces[0].ratio,
      ));
    }
    return puzzles;
  }

  static List<Piece> _getPuzzlePieces(List<Piece> pieces) {
    var refPiece = pieces[0];
    List<Piece> matchingPieces = [];
    for (int i = 0; i < pieces.length; i++) {
      if (pieces[i].puzzleId == refPiece.puzzleId) {
        matchingPieces.add(pieces[i]);
        pieces.remove(pieces[i]);
        i--;
      }
    }
    return matchingPieces;
  }

  static void _sortPuzzlePieces(List<Piece> puzzlePieces) {
    puzzlePieces.sort((a, b) => a.index.compareTo(b.index));
  }
}
