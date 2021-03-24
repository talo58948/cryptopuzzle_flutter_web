import 'dart:convert';
import 'package:http/http.dart';
import 'package:web1/constants.dart';

import 'models/piece.dart';
import 'models/puzzle.dart';

//{CURRENTLY INACTIVE}
// import 'tester/tester.dart' as tester;

const numOfPieces =
    9; //currently the number of pieces available, shit way to solve a shit question. TODO: make it a better solution

const contractAddres =
    kContractAddress; //the contract address of our organization

const auth = 'api.opensea.io'; //the authority, the domain

const multyAssetsPath =
    '/api/v1/assets'; //the path to multiple assets given creator contract address

class Networker {
  Future<dynamic> getAllPieceIds() async {
    Future<Response> res = get(
      Uri.https(
        'amplify-amplifyf3edbb9089d84-staging-221737-deployment.s3.amazonaws.com',
        'tokens.json',
      ),
    );

    return res.then((value) {
      return jsonDecode(value.body)['tokens'];
    });
  }

  //gets all the assets to our organization name in OpenSea, returns a future instance of the json content
  Future<dynamic> getAllAssets() async {
    return getAllPieceIds().then(
      (ids) {
        //params for the request
        Map<String, dynamic> params = {
          'offset': '0',
          'limit': '50',
          'token_ids': ids,
        };

        int offset =
            0; //the offset of the request (0 means the first, 50 means the fifty first)

        List<Future<Response>> responses = []; //a list of future responses

        for (int i = 0; i < (ids.length / 50) + 1; i++) {
          Future<Response> res = get(
            Uri.https(
              auth,
              multyAssetsPath,
              params,
            ),
          );
          responses.add(res);
          offset += 50;
          params['offset'] = offset.toString();
        }

        return Future.wait(responses).then(
          (resList) {
            List<dynamic> assets = [];

            resList.forEach((element) {
              assets +=
                  jsonDecode(element.body.replaceAll('\n', '\\n'))['assets'];
            });

            // print('assets are ${assets.length}');
            modifyAssets(assets);
            return assets.reversed.toList();
          },
        ).catchError((e) {
          print('ERROR ON QUERYING DATA\n' + e.toString());
        });
      },
    );
  }

  static void modifyAssets(List<dynamic> assets) {
    assets.forEach((asset) {
      asset['traits'] = turnTraitsListToObject(asset['traits']);
    });
  }

  static Map<String, dynamic> turnTraitsListToObject(List<dynamic> traits) {
    Map<String, dynamic> obj = {
      'rarity': '',
      'size': '',
      'puzzle_id': '',
      'puzzle_name': '',
      'index': '',
      'length': '',
    };
    traits.forEach((trait) {
      obj[trait['trait_type'].trim().toLowerCase()] = trait['value'];
    });
    return obj;
  }

  //get all puzzles, decodes the assets to puzzles {see puzzle in the models folder}
  Future<List<Puzzle>> getAllPuzzles() async {
    return getAllAssets().then((assets) {
      List<dynamic> piecesJson = assets;
      List<Piece> pieces = [];
      try {
        piecesJson.forEach((pieceJson) {
          pieces.add(Piece.fromJson(pieceJson));
        });
      } catch (e) {}
      return Puzzle.getPuzzles(pieces);
    }).catchError((e) {
      print('HERE + ${e.toString()}');
    });
  }

  // // a debugging tool to get all dummy assets {CURRENTLY INACTIVE}
  // Future<dynamic> getAllAssetsTest() async {
  //   Future<Response> res = get(
  //     Uri.https(
  //         'amplify-amplifyf3edbb9089d84-staging-221737-deployment.s3.amazonaws.com',
  //         'tokens.json'),
  //   );
  //   return res.then((value) => jsonDecode(value.body)['tokens']);
}
// }

// //for debugging {CURRENTLY INACTIVE}
// void main() async {
//   Networker networker = Networker();
//   print('home');
//   string = string.replaceAll('\n', '\\n');
//   Map<String, dynamic> json = jsonDecode(string);
//   print(json['traits']['length']);
// }
