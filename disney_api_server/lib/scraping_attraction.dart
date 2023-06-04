import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;

class Scraping {
  static Future<List<String>?> scrapingAttraction(url) async {
    final target = Uri.parse(url);

    // 取得する。
    final response = await http.get(target);

    if (response.statusCode != 200) {
      print('ERROR: ${response.statusCode}');
      return null;
    }

    final document = parse(response.body);

    var result = document.querySelectorAll('h3').map((v) => v.text).toList();
    print(result);
    final removeElements = ['エリア', '特徴', '利用制限'];

    for (var removeElement in removeElements) {
      result.removeWhere((element) => element == removeElement);
    }
    //取得したアトラクション名を整形
    for (var i = 0; i < result.length; i++) {
      for (var removeText in ['NEW', ' ', '\n']) {
        result[i] = result[i].replaceAll(removeText, '');
      }
    }
    //重複要素の削除
    result = result.toSet().toList();
    print(result);
    print(result.length);
    return result;
  }
}
