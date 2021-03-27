import 'package:flutter/material.dart'
    show AssetImage, ImageProvider, NetworkImage, required;
import '../constants.dart';
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

  String toString() {
    return owner.name +
        ' ' +
        owned.toString() +
        ' ' +
        ratio.toString() +
        ' ' +
        rarity.toString() +
        ' ' +
        puzzleId.toString() +
        ' ' +
        puzzleName.toString() +
        ' ' +
        index.toString() +
        ' ' +
        ethPrice.toString() +
        ' ' +
        usdPrice.toString() +
        ' ' +
        permalink;
  }

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
        owned = (json['owner']['address'] != kContractAddress) &&
            (json['owner']['address'] != kOpenSeaContractAddress) &&
            (json['owner']['address'] != kNullAddress),
        owner = User.fromJson(json['owner']['user']),
        puzzleId = json['traits']['puzzle_id'],
        puzzleName = json['traits']['puzzle_name'],
        index = int.parse(json['traits']['index']),
        length = int.parse(json['traits']['length']),
        // ethPrice = json['sell_orders'].length != 0
        //     ? double.parse(
        //         json['sell_orders']['payment_token_contract']['eth_price'])
        //     : 0.0,
        // usdPrice = json['sell_orders'].length != 0
        //     ? double.parse(
        //         json['sell_orders']['payment_token_contract']['usd_price'])
        //     : 0.0,
        ethPrice = 0,
        usdPrice = 0,
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
