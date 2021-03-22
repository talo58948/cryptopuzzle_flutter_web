import 'package:flutter/material.dart';
import 'package:web1/components/content_container.dart';
import 'package:web1/components/go_to_button.dart';
import 'package:web1/components/piece_widget.dart';
import 'package:web1/components/transaction_history.dart';
import 'package:web1/constants.dart';
import 'package:web1/external/my_flutter_app_icons.dart';
import 'package:web1/models/piece.dart';
import 'package:web1/pages/custom_page.dart';

import '../manager.dart';

class PiecePageArgs {
  final Piece piece;
  PiecePageArgs(this.piece);
}

class PiecePage extends StatelessWidget {
  static const routeName = '/piece';
  PiecePage();
  @override
  Widget build(BuildContext context) {
    final PiecePageArgs args = ModalRoute.of(context).settings.arguments;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (args == null) {
        Manager.moveTo(Pages.home, context);
      }
    });

    final Piece piece = args != null ? args.piece : null;
    return CustomPage(
      child: args == null
          ? Container()
          : ContentContainer(
              children: [
                Text(
                  piece.owned ? 'OWNED BY: ${piece.owner.name}' : 'UP FOR SALE',
                  style: kTitleStyle,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PieceWidget(
                      piece: piece,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: Text(
                            'Ξ ${piece.ethPrice}',
                            style: kPriceTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          child: Text(
                            '\$ ${piece.usdPrice}',
                            style: kPriceTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GoToButton(
                          url: piece.permalink,
                          color: Colors.blueAccent,
                          text: 'OpenSea',
                        ),
                      ],
                    )
                  ],
                ),
                // TransactionHistory(),
              ],
            ),
    );
  }
}
