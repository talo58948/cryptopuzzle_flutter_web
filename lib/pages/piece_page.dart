import 'package:flutter/material.dart';
import 'package:web1/components/content_container.dart';
import 'package:web1/components/go_to_button.dart';
import 'package:web1/components/piece_widget.dart';
import 'package:web1/constants.dart';
import 'package:web1/models/piece.dart';
import 'package:web1/pages/custom_page.dart';
import 'package:web1/external/extensions.dart';
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
    try {
      return CustomPage(
        page: Pages.piece,
        child: args == null
            ? Container(
                child: Text('Failed to load piece :/'),
              )
            : ContentContainer(
                children: [
                  Text(
                    '${piece.puzzleName} piece #${piece.index}',
                    style: kTitleStyle,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PieceWidget(
                        piece: piece,
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      _RightDiv(piece: piece)
                    ],
                  ),
                  // TransactionHistory(),
                ],
              ),
      );
    } catch (e) {
      return Container(
        child: Text('er'),
      );
    }
  }
}

class _RightDiv extends StatelessWidget {
  const _RightDiv({
    Key key,
    @required this.piece,
  }) : super(key: key);

  final Piece piece;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _OwnedWidget(
            owned: piece.owned,
            ownerName: piece.owner.name,
          ),
          SizedBox(
            height: 40.0,
          ),
          piece.usdPrice == 0
              ? SizedBox(
                  height: 0.0,
                )
              : _PriceWidget(
                  usdPrice: piece.usdPrice,
                  ethPrice: piece.ethPrice,
                ),
          piece.usdPrice == 0
              ? SizedBox(
                  height: 0,
                )
              : SizedBox(
                  height: 40.0,
                ),
          _RarityWidget(
            rarity: piece.rarity,
          ),
          SizedBox(
            height: 50,
          ),
          GoToButton(
            url: piece.permalink,
            color: Color(0xFF427DBD),
            image: AssetImage('images/opensea_logo.png'),
            text: 'OpenSea',
          ),
        ],
      ),
    );
  }
}

class _OwnedWidget extends StatelessWidget {
  final bool owned;
  final String ownerName;
  _OwnedWidget({this.owned = false, this.ownerName = 'DEFAULT USERNAME'});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          owned ? 'Owner: $ownerName' : 'No Owner',
          style: kPriceTextStyle,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

class _PriceWidget extends StatelessWidget {
  final double ethPrice;
  final double usdPrice;
  _PriceWidget({
    this.ethPrice = 0.0,
    this.usdPrice = 0,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          usdPrice == 0
              ? 'Price is not currently set'
              : 'Price:  Ξ ${ethPrice.toStringAsFixed(2)} ',
          textAlign: TextAlign.left,
          style:
              usdPrice == 0 ? kSemiTransparentPiecePageStyle : kPriceTextStyle,
        ),
        usdPrice == 0
            ? SizedBox(width: 0.0)
            : Text(
                '(\$${usdPrice.toStringAsFixed(0)})',
                textAlign: TextAlign.left,
                style: kSemiTransparentPiecePageStyle,
              ),
      ],
    );
  }
}

class _RarityWidget extends StatelessWidget {
  final Rarity rarity;

  _RarityWidget({@required this.rarity});

  Widget buildRow() {
    List<Widget> rowChildren = [];
    int _numOfYellowStars = rarity.index;
    for (int i = 0; i < Rarity.values.length; i++) {
      rowChildren.add(
        Icon(
          Icons.star,
          size: kStarSize,
          color: _numOfYellowStars < 0 ? Colors.black : Colors.yellow,
        ),
      );
      _numOfYellowStars--;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
            Text(
              'Rarity: ',
              style: kPriceTextStyle,
              textAlign: TextAlign.left,
            )
          ] +
          rowChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildRow(),
        SizedBox(
          height: 5.0,
          width: 5.0,
        ),
        Text(
          '(${rarity.toString().replaceAll('Rarity.', '').capitalize()})',
          style: kSemiTransparentPiecePageStyle,
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
