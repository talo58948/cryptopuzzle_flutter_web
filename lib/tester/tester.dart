import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web1/models/piece.dart';
import 'package:web1/models/puzzle.dart';

Future tester() async {
  String content = p;
  Map<String, dynamic> j = jsonDecode(content);
  var assets = j['assets'];

  List<dynamic> piecesJson = assets;
  List<Piece> pieces = [];
  piecesJson.forEach((pieceJson) {
    pieces.add(Piece.fromJson(pieceJson));
  });
  List<Puzzle> puzzles = Puzzle.getPuzzles(pieces);
  print(puzzles[0].puzzlePieces[0].index);
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    tester().then((value) => null);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Text('test'),
        ),
      ),
    );
  }
}

const p = '''{
    "assets":[
       {
          "image_url":"https://lh3.googleusercontent.com/8O6-2qoV1lVZggyEZGc9GfKvjuvDPW9UMeG2AUnmG8w-W8pQOInUQyaj31dPhskcSLtLdER7cHmLAZnR9KqJzXpDv4Gi8CNXOLmc9Fo",
          "traits":{
             "puzzle_id":"p1",
             "puzzle_name":"p1Name",
             "index":0,
             "length":9,
             "size":"500x400",
             "rarity":"common"
          },
          "owner":{
                "user": {
                    "username":"default username"
                },
                "address":"0xcontactaddress"
          },
          "sell_orders":{"payment_token_contract":{"eth_price": "1.01","usd_price":"1762.2"}}
       },
       {
          "image_url":"https://lh3.googleusercontent.com/8O6-2qoV1lVZggyEZGc9GfKvjuvDPW9UMeG2AUnmG8w-W8pQOInUQyaj31dPhskcSLtLdER7cHmLAZnR9KqJzXpDv4Gi8CNXOLmc9Fo",
          "traits":{
             "puzzle_id":"p1",
             "puzzle_name":"p1Name",
             "index":1,
             "length":9,
             "size":"500x400",
             "rarity":"common"
          }
          ,
          "owner":{
                "user": {
                    "username":"default username"
                },
                "address":"0xcontactaddress"
          },
          "sell_orders":{"payment_token_contract":{"eth_price": "1.01","usd_price":"1762.2"}}
       },
       {
          "image_url":"https://lh3.googleusercontent.com/8O6-2qoV1lVZggyEZGc9GfKvjuvDPW9UMeG2AUnmG8w-W8pQOInUQyaj31dPhskcSLtLdER7cHmLAZnR9KqJzXpDv4Gi8CNXOLmc9Fo",
          "traits":{
             "puzzle_id":"p1",
             "puzzle_name":"p1Name",
             "index":2,
             "length":9,
             "size":"500x400",
             "rarity":"common"
          },
          "owner":{
                "user": {
                    "username":"default username"
                },
                "address":"0xcontactaddress"
          },
          "sell_orders":{"payment_token_contract":{"eth_price": "1.01","usd_price":"1762.2"}}
       },
       {
          "image_url":"https://lh3.googleusercontent.com/8O6-2qoV1lVZggyEZGc9GfKvjuvDPW9UMeG2AUnmG8w-W8pQOInUQyaj31dPhskcSLtLdER7cHmLAZnR9KqJzXpDv4Gi8CNXOLmc9Fo",
          "traits":{
             "puzzle_id":"p1",
             "puzzle_name":"p1Name",
             "index":3,
             "length":9,
             "size":"500x400",
             "rarity":"common"
          },
          "owner":{
                "user": {
                    "username":"default username"
                },
                "address":"0xcontactaddress"
          },
          "sell_orders":{"payment_token_contract":{"eth_price": "1.01","usd_price":"1762.2"}}
       },
       {
          "image_url":"https://lh3.googleusercontent.com/8O6-2qoV1lVZggyEZGc9GfKvjuvDPW9UMeG2AUnmG8w-W8pQOInUQyaj31dPhskcSLtLdER7cHmLAZnR9KqJzXpDv4Gi8CNXOLmc9Fo",
          "traits":{
             "puzzle_id":"p1",
             "puzzle_name":"p1Name",
             "index":4,
             "length":9,
             "size":"500x400",
             "rarity":"common"
          },
          "owner":{
                "user": {
                    "username":"default username"
                },
                "address":"0xcontactaddress"
          },
          "sell_orders":{"payment_token_contract":{"eth_price": "1.01","usd_price":"1762.2"}}
       },
       {
          "image_url":"https://lh3.googleusercontent.com/8O6-2qoV1lVZggyEZGc9GfKvjuvDPW9UMeG2AUnmG8w-W8pQOInUQyaj31dPhskcSLtLdER7cHmLAZnR9KqJzXpDv4Gi8CNXOLmc9Fo",
          "traits":{
             "puzzle_id":"p1",
             "puzzle_name":"p1Name",
             "index":5,
             "length":9,
             "size":"500x400",
             "rarity":"common"
          },
          "owner":{
                "user": {
                    "username":"default username"
                },
                "address":"0xcontactaddress"
          },
          "sell_orders":{"payment_token_contract":{"eth_price": "1.01","usd_price":"1762.2"}}
       },
       {
          "image_url":"https://lh3.googleusercontent.com/8O6-2qoV1lVZggyEZGc9GfKvjuvDPW9UMeG2AUnmG8w-W8pQOInUQyaj31dPhskcSLtLdER7cHmLAZnR9KqJzXpDv4Gi8CNXOLmc9Fo",
          "traits":{
             "puzzle_id":"p1",
             "puzzle_name":"p1Name",
             "index":6,
             "length":9,
             "size":"500x400",
             "rarity":"common"
          },
          "owner":{
                "user": {
                    "username":"default username"
                },
                "address":"0xcontactaddress"
          },
          "sell_orders":{"payment_token_contract":{"eth_price": "1.01","usd_price":"1762.2"}}
       },
       {
          "image_url":"https://lh3.googleusercontent.com/8O6-2qoV1lVZggyEZGc9GfKvjuvDPW9UMeG2AUnmG8w-W8pQOInUQyaj31dPhskcSLtLdER7cHmLAZnR9KqJzXpDv4Gi8CNXOLmc9Fo",
          "traits":{
             "puzzle_id":"p1",
             "puzzle_name":"p1Name",
             "index":7,
             "length":9,
             "size":"500x400",
             "rarity":"common"
          },
          "owner":{
                "user": {
                    "username":"default username"
                },
                "address":"0xcontactaddress"
          },
          "sell_orders":{"payment_token_contract":{"eth_price": "1.01","usd_price":"1762.2"}}
       },
       {
          "image_url":"https://lh3.googleusercontent.com/8O6-2qoV1lVZggyEZGc9GfKvjuvDPW9UMeG2AUnmG8w-W8pQOInUQyaj31dPhskcSLtLdER7cHmLAZnR9KqJzXpDv4Gi8CNXOLmc9Fo",
          "traits":{
             "puzzle_id":"p1",
             "puzzle_name":"p1Name",
             "index":8,
             "length":9,
             "size":"500x400",
             "rarity":"common"
          },
          "owner":{
                "user": {
                    "username":"default username"
                },
                "address":"0xcontactaddress"
          },
          "sell_orders":{"payment_token_contract":{"eth_price": "1.01","usd_price":"1762.2"}}
       },
       {
          "image_url":"https://lh3.googleusercontent.com/8O6-2qoV1lVZggyEZGc9GfKvjuvDPW9UMeG2AUnmG8w-W8pQOInUQyaj31dPhskcSLtLdER7cHmLAZnR9KqJzXpDv4Gi8CNXOLmc9Fo",
          "traits":{
             "puzzle_id":"p2",
             "puzzle_name":"p2Name",
             "index":0,
             "length":4,
             "size":"500x400",
             "rarity":"common"
          },
          "owner":{
                "user": {
                    "username":"default username"
                },
                "address":"0xcontactaddress"
          },
          "sell_orders":{"payment_token_contract":{"eth_price": "1.01","usd_price":"1762.2"}}
       },
       {
          "image_url":"https://lh3.googleusercontent.com/8O6-2qoV1lVZggyEZGc9GfKvjuvDPW9UMeG2AUnmG8w-W8pQOInUQyaj31dPhskcSLtLdER7cHmLAZnR9KqJzXpDv4Gi8CNXOLmc9Fo",
          "traits":{
             "puzzle_id":"p2",
             "puzzle_name":"p2Name",
             "index":3,
             "length":4,
             "size":"500x400",
             "rarity":"common"
          },
          "owner":{
                "user": {
                    "username":"default username"
                },
                "address":"0xcontactaddress"
          },
          "sell_orders":{"payment_token_contract":{"eth_price": "1.01","usd_price":"1762.2"}}
       },
       {
          "image_url":"https://lh3.googleusercontent.com/8O6-2qoV1lVZggyEZGc9GfKvjuvDPW9UMeG2AUnmG8w-W8pQOInUQyaj31dPhskcSLtLdER7cHmLAZnR9KqJzXpDv4Gi8CNXOLmc9Fo",
          "traits":{
             "puzzle_id":"p2",
             "puzzle_name":"p2Name",
             "index":2,
             "length":4,
             "size":"500x400",
             "rarity":"common"
          },
          "owner":{
                "user": {
                    "username":"default username"
                },
                "address":"0xcontactaddress"
          },
          "sell_orders":{"payment_token_contract":{"eth_price": "1.01","usd_price":"1762.2"}}
       },
       {
          "image_url":"https://lh3.googleusercontent.com/8O6-2qoV1lVZggyEZGc9GfKvjuvDPW9UMeG2AUnmG8w-W8pQOInUQyaj31dPhskcSLtLdER7cHmLAZnR9KqJzXpDv4Gi8CNXOLmc9Fo",
          "traits":{
             "puzzle_id":"p2",
             "puzzle_name":"p2Name",
             "index":1,
             "length":4,
             "size":"500x400",
             "rarity":"common"
          },
          "owner":{
                "user": {
                    "username":"default username"
                },
                "address":"0xcontactaddress"
          },
          "sell_orders":{"payment_token_contract":{"eth_price": "1.01","usd_price":"1762.2"}}
       }
    ]
 }
''';
