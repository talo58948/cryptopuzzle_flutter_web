import 'package:flutter/material.dart';
import 'package:web1/models/puzzle.dart';

class PuzzleWidget extends StatelessWidget {
  final bool isHovered;
  final Puzzle puzzle;
  // final
  PuzzleWidget({this.isHovered = false, this.puzzle}){
    if(this.puzzle == null){
      this.puzzle =Puzzle.Default();
    }
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [],
        )
      ],
    );
  }
}
