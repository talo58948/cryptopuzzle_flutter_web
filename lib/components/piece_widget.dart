import 'package:flutter/material.dart';
import 'package:web1/constants.dart';
import 'package:web1/models/piece.dart';

class PieceWidget extends StatelessWidget {
  final Piece piece;
  PieceWidget({this.piece});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: kFocusedPieceWidth,
      child: Center(
        child: Image(
          image: piece.image,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
