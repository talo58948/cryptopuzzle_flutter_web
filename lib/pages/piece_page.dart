import 'package:flutter/material.dart';
import 'package:web1/models/piece.dart';

class PiecePage extends StatelessWidget {
  final Piece piece;
  PiecePage({@required this.piece});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('piece owned by ${piece.owner}'),
      ),
    );
  }
}
