import 'package:flutter/material.dart';
import 'package:training36_word_zone_app/services/word_time.dart';

class Konum extends StatefulWidget {
  @override
  _KonumState createState() => _KonumState();
}

class _KonumState extends State<Konum> {
  List<WordTime> konumlar = [
    WordTime(url: "Europe/Istanbul", konum: "Istanbul", bayrak: "turkiye.jpg"),
    WordTime(url: "America/Chicago", konum: "Chicago", bayrak: "amerika.jpg"),
    WordTime(url: "America/New_York", konum: "New York", bayrak: "amerika.jpg"),
    WordTime(url: "Europe/London", konum: "London", bayrak: "ingiltere.jpg"),
    WordTime(url: "Europe/Berlin", konum: "Berlin", bayrak: "almanya.jpg"),
    WordTime(url: "Asia/Seoul", konum: "Seoul", bayrak: "guney-kore.jpg"),
    WordTime(url: "Asia/Tokyo", konum: "Tokyo", bayrak: "japonya.jpg"),
  ];

  void zamanGuncelle(index) async {
    WordTime nesne = konumlar[index];
    await nesne.getZaman();

    Navigator.pop(context, {
      "konum": nesne.konum,
      "zaman": nesne.zaman,
      "bayrak": nesne.bayrak,
      "gunZaman": nesne.gunZaman
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(242, 233, 225, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(203, 232, 107, 1),
          title: Center(
              child: Text(
            "Konum Seç",
            style: TextStyle(color: Color.fromRGBO(28, 20, 13, 1)),
          )),
          elevation: 0.0,
        ),
        body: ListView.builder(
            itemCount: konumlar.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      zamanGuncelle(index);
                    },
                    title: Text(konumlar[index].konum),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/${konumlar[index].bayrak}"),
                    ),
                  ),
                ),
              );
            }));
  }
}
