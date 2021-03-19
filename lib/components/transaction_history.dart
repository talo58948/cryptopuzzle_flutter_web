import 'package:flutter/material.dart';
import 'package:web1/models/piece.dart';

class TransactionHistory extends StatelessWidget {
  final Piece piece;
  TransactionHistory({this.piece});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('TRANSACTION HISTORY'),
    );
  }
}
