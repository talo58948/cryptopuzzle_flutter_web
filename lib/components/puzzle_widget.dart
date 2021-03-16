import 'package:web1/models/piece.dart';
import 'package:flutter/material.dart';
import 'package:web1/models/puzzle.dart';
import 'dart:math';
import 'package:web1/manager.dart';

class PuzzleWidget extends StatelessWidget {
  final bool showGrid;
  final Puzzle puzzle;
  const PuzzleWidget({this.showGrid = false, this.puzzle = Puzzle.dflt});

  Widget _getColumn() {
    int _sideLen = sqrt(puzzle.numberOfPieces).round();
    List<Row> columnChildren = [];
    for (int i = 0; i < _sideLen; i++) {
      List<_PuzzlePiece> rowChildren = [];
      for (int i = 0; i < _sideLen; i++) {
        rowChildren.add(
          _PuzzlePiece(
            piece: puzzle.puzzlePieces[i],
            onPressed: Manager.onPressOnPiece(
              puzzle.puzzlePieces[i],
            ),
          ),
        );
      }
      columnChildren.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rowChildren,
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: columnChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getColumn();
  }
}

class _PuzzlePiece extends StatefulWidget {
  final Piece piece;
  final Function onPressed;
  _PuzzlePiece({@required this.piece, @required this.onPressed});

  @override
  __PuzzlePieceState createState() => __PuzzlePieceState();
}

class __PuzzlePieceState extends State<_PuzzlePiece> {
  bool showOutline = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        showOutline = true;
        setState(() {});
      },
      onExit: (event) {
        showOutline = false;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: !showOutline
              ? null
              : [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
        ),
        child: FlatButton(
          hoverColor: Colors.transparent,
          padding: EdgeInsets.all(0.0),
          onPressed: widget.onPressed,
          child: Image(
            image: widget.piece.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
