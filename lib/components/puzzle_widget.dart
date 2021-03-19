import 'package:web1/models/piece.dart';
import 'package:flutter/material.dart';
import 'package:web1/models/puzzle.dart';
import 'dart:math';
import 'package:web1/manager.dart';

class PuzzleWidget extends StatefulWidget {
  final Puzzle puzzle;
  const PuzzleWidget({this.puzzle = Puzzle.dflt});

  @override
  _PuzzleWidgetState createState() => _PuzzleWidgetState();
}

class _PuzzleWidgetState extends State<PuzzleWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    controller.addListener(() {
      gap = controller.value * 10.0;
      setState(() {});
    });
  }

  double gap = 0.0;
  Widget _getColumn() {
    int _sideLen = sqrt(widget.puzzle.numberOfPieces).round();
    List<Widget> columnChildren = [];
    for (int i = 0; i < _sideLen; i++) {
      List<Widget> rowChildren = [];
      for (int j = 0; j < _sideLen; j++) {
        rowChildren.add(
          _PuzzlePiece(
            piece: widget.puzzle.puzzlePieces[i * _sideLen + j],
            onPressed: Manager.onPressOnPiece(
              widget.puzzle.puzzlePieces[i],
            ),
          ),
        );
        rowChildren.add(SizedBox(
          width: gap,
        ));
      }
      rowChildren.removeLast();
      columnChildren.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: rowChildren,
        ),
      );
      columnChildren.add(
        SizedBox(
          height: gap,
        ),
      );
    }
    columnChildren.removeLast();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: columnChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) {
          controller.forward();
        },
        onExit: (event) {
          controller.reverse();
        },
        child: _getColumn());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
        child: ButtonTheme(
          padding: EdgeInsets.symmetric(
              vertical: 0.0, horizontal: 0.0), //adds padding inside the button
          materialTapTargetSize: MaterialTapTargetSize
              .shrinkWrap, //limits the touch area to the button area
          minWidth: 0, //wraps child's width
          height: 0, //wraps child's height
          child: FlatButton(
            onPressed: widget.onPressed,
            child: Image(
              image: widget.piece.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
/*ButtonTheme(
  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0), //adds padding inside the button
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, //limits the touch area to the button area
  minWidth: 0, //wraps child's width
  height: 0, //wraps child's height
  child: RaisedButton(onPressed: (){}, child: Text('Button Text')), //your original button
);*/
