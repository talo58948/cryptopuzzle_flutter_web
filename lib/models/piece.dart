import 'package:flutter/material.dart'
    show AssetImage, ImageProvider, NetworkImage, required;
import 'user.dart';
import 'package:web1/constants.dart';

class Piece {
  final ImageProvider image;
  final User owner;
  final bool owned;
  final double ratio;
  final Rarity rarity;

  final String puzzleId;
  final String puzzleName;
  final int index;
  final int length;

  final double ethPrice;
  final double usdPrice;
  final String permalink;

  static const Piece dflt = Piece(
    image: AssetImage('images/piece2.png'),
    owner: User.dflt,
    owned: false,
    ratio: 1.0,
    rarity: Rarity.rare,
    permalink:
        "https://www.youtube.com/watch?v=SsW4npZ0bDk&ab_channel=penguinz0",
  );
  const Piece({
    @required this.image,
    @required this.owner,
    @required this.owned,
    this.ratio,
    @required this.rarity,
    this.puzzleId,
    this.puzzleName,
    this.index,
    this.length,
    this.ethPrice = 0,
    this.usdPrice = 0,
    @required this.permalink,
  });

  Piece.fromJson(Map<String, dynamic> json)
      : image = NetworkImage(json['image_url']),
        rarity = _rarityFromString(json['traits']['rarity']),
        ratio = _widthHeightRatioFromString(json['traits']['size']),
        owner = User.fromJson(json['owner']['user']),
        owned = json['owner']['address'] != kContractAddress,
        puzzleId = json['traits']['puzzle_id'],
        puzzleName = json['traits']['puzzle_name'],
        index = json['traits']['index'].toInt(),
        length = json['traits']['length'].toInt(),
        ethPrice = double.parse(
            json['sell_orders']['payment_token_contract']['eth_price']),
        usdPrice = double.parse(
            json['sell_orders']['payment_token_contract']['usd_price']),
        permalink = json['permalink'];
}

double _widthHeightRatioFromString(String string) {
  var arr = string.split('x');
  double width = double.parse(arr[0]);
  double height = double.parse(arr[1]);
  return height / width;
}

Rarity _rarityFromString(String string) {
  switch (string) {
    case 'legendary':
      return Rarity.legendary;
    case 'rare':
      return Rarity.rare;
    case 'common':
      return Rarity.common;
    default:
      return Rarity.common;
  }
}

enum Rarity { common, rare, legendary }
