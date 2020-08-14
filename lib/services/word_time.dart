import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

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

      zaman = DateFormat.jm()
          .format(now); // saat ve dakika formatlandı (zaman:2:05)
      // zaman = DateFormat.j().format(now); // saat formatlandı (zaman:2 PM)
      // zaman = DateFormat.d().format(now); // ayın kacıncı günü olduğu formatlandı (zaman:14)
      // zaman = DateFormat.LLL().format(now); // ayın isminin kısaltılmışı (zaman:Aug)
      // zaman = DateFormat.LLLL().format(now); // ayın isminin tam adı (zaman:August)
      // zaman = DateFormat.yMMMd().format(now); // (zaman:Aug 14, 2020)
      // zaman = DateFormat.yMd().format(now); // (zaman:8/14/2020)
      // zaman = DateFormat.Hm().format(now); // saat gösteriyor (zaman:15:30)
      // zaman = DateFormat.Hms().format(now); // saat gösteriyor (zaman:15:30:32)
      // zaman = DateFormat.EEEE().format(now); // günü gösteriyor (zaman: Friday)
      // zaman = DateFormat.E().format(now); // günün kısaltılmışını gösteriyor (zaman: Fri)
    } catch (e) {
      zaman = "Zaman bilgisi getirilemedi.";
    }
  }
}
