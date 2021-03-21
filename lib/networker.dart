import 'dart:convert';
import 'package:http/http.dart';
import 'package:web1/constants.dart';

import 'models/piece.dart';
import 'models/puzzle.dart';
import 'tester/tester.dart' as tester;

const numOfPieces = 63;
const contractAddres = kContractAddress;
Uri uri = Uri.https('api.opensea', '/api/v1/assets', {
  'asset_contract_address': contractAddres,
  'offset': 0,
  'limit': 50,
});
const auth = 'api.opensea.io';
const path = '/api/v1/assets';
// "https://api.opensea.io/api/v1/assets?asset_contract_address=$contactAddres&offset=";

class Networker {
  Future<dynamic> getAllAssets() async {
    int offset = 0;
    Map<String, String> params = {
      'asset_contract_address': contractAddres,
      'offset': '0',
      'limit': '50',
    };

    List<Future<Response>> responses = [];
    for (int i = 0; i < numOfPieces / 50; i++) {
      Future<Response> res = get(
        Uri.https(auth, path, params),
      );
      offset += 50;
      params['offset'] = offset.toString();
      params['limit'] = (numOfPieces - i * 50) / 50 > 1
          ? ((numOfPieces - i * 50) % 50).toString()
          : '50';
      responses.add(res);
    }
    return Future.wait(responses).then(
      (value) {
        var resList = value;
        List<dynamic> assets = [];
        resList.forEach((element) {
          assets += jsonDecode(element.body)['assets'];
        });
        return assets;
      },
    ).catchError((e) {
      print('ERROR ON QUERYING DATA\n' + e);
    });
  }

  Future<dynamic> getAllAssetsTest() async {
    return json.decode(tester.p)['assets'];
  }
//   Future<List<Puzzle>> getAllPuzzles() async {
//     return getAllAssets().then(
//       (assets) {
//         List<dynamic> pieces = assets;
//         List<Puzzle> puzzles = [];
//         for (int i = 0; i < pieces.length; i += 9) {
//           List<Piece> puzzlePieces = [];
//           for (int j = 0; j < 9; j++) {
//             var pieceMap = pieces[i + j];
//             print('image_url is: ${pieceMap['image_url']}');
//             puzzlePieces.add(
//               Piece(
//                 image: NetworkImage(
//                   pieceMap['image_url'] != null
//                       ? pieceMap['image_url']
//                       : "https://lh3.googleusercontent.com/M5n8x0OnjwHZ2a3Z_pnYenVWhg4mFV5INemsRHuO6OnzoAsplgr8hxFs8YxPqEDi_xShZq-uvNomgxa5b6UOB0wEgTsoOUn-Ewz28A",
//                 ),
//                 owner: User(
//                   name: pieceMap['asset_contract']['owner'],
//                 ),
//                 owned: pieceMap['asset_contract']['owner'] != null,
//                 rarity: Rarity.rare,
//                 ratio: 1,
//               ),
//             );
//           }

//           puzzles.add(
//             Puzzle(
//               id: '#8552',
//               puzzlePieces: puzzlePieces,
//               numberOfPieces: 9,
//               name: 'LOL N',
//               ratio: 1.0,
//             ),
//           );
//         }
//         return puzzles;
//       },
//     ).catchError(
//       (e) {
//         print('ERROR PARSING PUZZLES\n $e');
//       },
//     );
//   }
// }
  Future<List<Puzzle>> getAllPuzzles() async {
    return getAllAssetsTest().then((assets) {
      List<dynamic> piecesJson = assets;
      List<Piece> pieces = [];
      piecesJson.forEach((pieceJson) {
        pieces.add(Piece.fromJson(pieceJson));
      });
      return Puzzle.getPuzzles(pieces);
    });
  }
}

void main() async {
  Networker networker = Networker();
  print('home');
  networker.getAllAssets().then((assets) {
    print(assets.length);
  });
}
