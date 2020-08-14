import 'package:http/http.dart' as http;
import 'dart:convert';

class WordTime {
  String konum;
  String zaman;
  String url;
  String bayrak;

  WordTime({this.konum, this.bayrak, this.url});

  Future<void> getZaman() async {
    try {
      http.Response res =
          await http.get("http://worldtimeapi.org/api/timezone/$url");
      Map veri = jsonDecode(res.body);
      String dateTime = veri["datetime"];
      DateTime now = DateTime.parse(dateTime);
      String offset = veri["utc_offset"]
          .substring(1, 3); // substing parça al gibi çalışıyor
      now = now.add(Duration(hours: int.parse(offset)));
      zaman = now.toString();
    } catch (e) {
      zaman = "Zaman bilgisi getirilemedi.";
    }
  }
}
