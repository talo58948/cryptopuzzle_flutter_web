import 'package:flutter/material.dart';
import 'package:web1/models/piece.dart';
import 'package:web1/models/puzzle.dart';
import 'dart:math';
import 'package:web1/manager.dart';
import 'package:web1/constants.dart';

class PuzzleContainer extends StatefulWidget {
  final Puzzle puzzle;
  PuzzleContainer({this.puzzle});

  @override
  _PuzzleContainerState createState() => _PuzzleContainerState();
}

class _PuzzleContainerState extends State<PuzzleContainer>
    with SingleTickerProviderStateMixin {
  double gap = 0.0;
  AnimationController _controller;
  //initiallizing animation controller and 'gap' variable which is responsible for the gap between puzzle pieces
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _controller.addListener(() {
      gap = _controller.value * 5;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //builds a puzzle which is made of grid(Column of Rows)
  Widget buildPuzzle(BoxConstraints constraints) {
    int sideLen = sqrt(widget.puzzle.puzzlePieces.length).toInt();

    double pieceWidth = kPuzzleWidth /
        sideLen; //single piece width and height, changes throughout the animation if focused on by mouse
    double pieceHeight = pieceWidth * widget.puzzle.ratio;

    List<Widget> columnChildren = [];
    for (int i = 0; i < sideLen * sideLen; i += sideLen) {
      List<Widget> rowChildren = [];
      for (int j = 0; j < sideLen; j++) {
        rowChildren.add(
          _PieceWidget(
            onPressed:
                Manager.onPressOnPiece(widget.puzzle.puzzlePieces[i + j]),
            piece: widget.puzzle.puzzlePieces[i + j],
            height: pieceHeight - gap * widget.puzzle.ratio,
            width: pieceWidth - gap,
          ),
        );
      }
      columnChildren.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rowChildren,
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: columnChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => MouseRegion(
        child: buildPuzzle(constraints),
        onEnter: (event) => _controller.forward(),
        onExit: (event) => _controller.reverse(),
      ),
    );
  }
}

class _PieceWidget extends StatelessWidget {
  final Function onPressed;
  final Piece piece;
  final double width;
  final double height;
  _PieceWidget({
    @required this.onPressed,
    @required this.piece,
    this.width,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: InkWell(
        onTap: () => onPressed(context),
        child: Image(
          image: piece.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ButtonTheme(
//               padding: EdgeInsets.symmetric(
//                   vertical: 0.0,
//                   horizontal: 0.0), //adds padding inside the button
//               materialTapTargetSize: MaterialTapTargetSize
//                   .shrinkWrap, //limits the touch area to the button area
//               minWidth: 0, //wraps child's width
//               height: 0, //wraps child's height

//                FlatButton(
//             padding: const EdgeInsets.all(0.0),
//             onPressed: onPressed,
//             child: Image(
//               image: piece.image,
//               fit: BoxFit.cover,
//             ),
//           ),
