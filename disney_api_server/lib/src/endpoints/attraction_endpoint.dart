import 'package:disney_api_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:disney_api_server/scraping_attraction.dart';

class AttractionEndpoint extends Endpoint {
  Future<bool> updateAttractionData(Session session) async {
    //
    await Attraction.delete(session, where: (t) => t.id >= 0);
    final url = 'https://www.tokyodisneyresort.jp/tds/attraction.html';
    final attractionNames = await Scraping.scrapingAttraction(url);
    if (attractionNames != null) {
      //取得したアトラクション名からAttraction型のListを作成
      final List<Attraction> attractions = List.generate(
        attractionNames.length,
        (index) {
          return Attraction(
              name: attractionNames[index],
              description: "",
              openingDate: DateTime.now());
        },
      );
      //1行ずつ挿入
      for (int i = 0; i < attractionNames.length; i++) {
        await Attraction.insert(session, attractions[i]);
      }
    }
    return true;
  }

  Future<List<Attraction>>? getAttractions(Session session,
      {String? keyword}) async {
    return await Attraction.find(
      session,
      // where: (t) =>
      //     keyword != null ? t.name.like('%$keyword%') : Constant(true),
    );
  }

  Future<bool> addAttraction(Session session, Attraction attraction) async {
    await Attraction.insert(session, attraction);
    return true;
  }

  Future<bool> updateAttraction(Session session, Attraction attraction) async {
    var result = await Attraction.update(session, attraction);
    return result;
  }

  // Future<String> test(Session session, String string) async {
  //   return "return $string";
  // }
}
