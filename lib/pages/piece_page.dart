import 'package:flutter/material.dart';
import 'package:web1/components/content_container.dart';
import 'package:web1/components/piece_widget.dart';
import 'package:web1/components/transaction_history.dart';
import 'package:web1/constants.dart';
import 'package:web1/models/piece.dart';
import 'package:web1/pages/custom_page.dart';

class PiecePage extends StatelessWidget {
  final Piece piece;
  PiecePage({@required this.piece});
  @override
  Widget build(BuildContext context) {
    return CustomPage(
      child: ContentContainer(
        children: [
          Text(
            piece.owned ? 'OWNED BY: ${piece.owner.name}' : 'UP FOR SALE',
            style: kTitleStyle,
          ),
          SizedBox(
            height: 50,
          ),
          PieceWidget(
            piece: piece,
          ),
          SizedBox(
            height: 50,
          ),
          TransactionHistory(),
        ],
      ),
    );
  }
}
