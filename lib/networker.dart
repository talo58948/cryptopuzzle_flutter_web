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

//for debugging {CURRENTLY INACTIVE}
void main() async {
  Networker networker = Networker();
  print('home');
  string = string.replaceAll('\n', '\\n');
  Map<String, dynamic> json = jsonDecode(string);
  print(json['traits']['length']);
}

String string =
    '''{"id":20334579,"token_id":"45847288414977551294315035162996554854439456582818672982733075806259964280833","num_sales":0,"background_color":null,"image_url":"https://lh3.googleusercontent.com/3cFg_3SGD-yt9hnSEXV-7RqfH-_mCSuqc9xcsZ7-zqnyBd8hxMwGr0BQmti71_bJ34GmBN_RHUYzvrns5phiGZ5OrTOnn5M0LxihyA","image_preview_url":"https://lh3.googleusercontent.com/3cFg_3SGD-yt9hnSEXV-7RqfH-_mCSuqc9xcsZ7-zqnyBd8hxMwGr0BQmti71_bJ34GmBN_RHUYzvrns5phiGZ5OrTOnn5M0LxihyA=s250","image_thumbnail_url":"https://lh3.googleusercontent.com/3cFg_3SGD-yt9hnSEXV-7RqfH-_mCSuqc9xcsZ7-zqnyBd8hxMwGr0BQmti71_bJ34GmBN_RHUYzvrns5phiGZ5OrTOnn5M0LxihyA=s128","image_original_url":null,"animation_url":null,"animation_original_url":null,"name":"Black hole sun puzzle piece #1","description":"The is a piece in the Black hole sun puzzle, the worlds first NFT puzzle!\nThis piece is unique and there will never be another like it.\n[This is the puzzle this image belongs to](https://i.imgur.com/2hfBqQhh.jpg).\n\n","external_link":"https://www.puzzletokens.net","asset_contract":{"address":"0x495f947276749ce646f68ac8c248420045cb7b5e","asset_contract_type":"semi-fungible","created_date":"2020-12-02T17:40:53.232025","name":"OpenSea Collection","nft_version":null,"opensea_version":"2.0.0","owner":102384,"schema_name":"ERC1155","symbol":"OPENSTORE","total_supply":null,"description":null,"external_link":null,"image_url":null,"default_to_fiat":false,"dev_buyer_fee_basis_points":0,"dev_seller_fee_basis_points":0,"only_proxied_transfers":false,"opensea_buyer_fee_basis_points":0,"opensea_seller_fee_basis_points":250,"buyer_fee_basis_points":0,"seller_fee_basis_points":250,"payout_address":null},"owner":{"user":{"username":"NullAddress"},"profile_img_url":"https://storage.googleapis.com/opensea-static/opensea-profile/1.png","address":"0x0000000000000000000000000000000000000000","config":"","discord_id":""},"permalink":"https://opensea.io/assets/0x495f947276749ce646f68ac8c248420045cb7b5e/45847288414977551294315035162996554854439456582818672982733075806259964280833","collection":{"banner_image_url":"https://lh3.googleusercontent.com/-qy2Gx_46Pm43CgFjNpfNRBtT20N6AXEHIhapsZuRHLzdhmluxhyxNgI8kOAjoR30hhN4ks1Up9eS96FjbS7wJuLtYQX76Q7DxXC=s2500","chat_url":null,"created_date":"2021-03-21T21:53:40.961771","default_to_fiat":false,"description":"A collaborative NFT puzzle collection - the worlds first NFT puzzle.  Each puzzle and piece is unique. \nGet puzzle pieces and complete puzzles with the world!\n","dev_buyer_fee_basis_points":"0","dev_seller_fee_basis_points":"1000","discord_url":null,"display_data":{"card_display_style":"contain"},"external_url":"http://puzzletokens.net","featured":false,"featured_image_url":"https://lh3.googleusercontent.com/jrnj1WCHpeSz95GLLYvL2fEeKRdr6Ogz_aK0MMoMVnv6HXrMVabo4cXU0ndi0k8vPx_zSVS11_GT69mMBRyTLFfu9sn6f9G3ttiSmQ=s300","hidden":true,"safelist_request_status":"not_requested","image_url":"https://lh3.googleusercontent.com/DH5jEYUboQs1E3PTa-wJCCK-5fO6x_9oBK-FfXktE0gUnZKoZq8PZqGKBplnR0KKH2h8tVLonPSeWv9L6V8xRuLBDw4-G_LNUyIH3g=s120","is_subject_to_whitelist":false,"large_image_url":"https://lh3.googleusercontent.com/jrnj1WCHpeSz95GLLYvL2fEeKRdr6Ogz_aK0MMoMVnv6HXrMVabo4cXU0ndi0k8vPx_zSVS11_GT69mMBRyTLFfu9sn6f9G3ttiSmQ=s300","medium_username":null,"name":"PuzzleTokens","only_proxied_transfers":false,"opensea_buyer_fee_basis_points":"0","opensea_seller_fee_basis_points":"250","payout_address":"0x655ca549cfcec6f3f8f224f7285fc05cf6c5ed1d","require_email":false,"short_description":null,"slug":"puzzletokens","telegram_url":null,"twitter_username":"PuzzleTokens","instagram_username":null,"wiki_url":null},"decimals":null,"sell_orders":[],"creator":{"user":{"username":null},"profile_img_url":"https://storage.googleapis.com/opensea-static/opensea-profile/10.png","address":"0x655ca549cfcec6f3f8f224f7285fc05cf6c5ed1d","config":"","discord_id":""},"traits":{"rarity":"rare","size":"1169x826","puzzle_id":"puzzle1","puzzle_name":"Black hole sun","index":"0","length":"9"},"last_sale":null,"top_bid":null,"listing_date":null,"is_presale":true,"transfer_fee_payment_token":null,"transfer_fee":null}''';
