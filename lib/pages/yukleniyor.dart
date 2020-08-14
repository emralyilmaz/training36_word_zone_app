import 'package:flutter/material.dart';
import 'package:training36_word_zone_app/services/word_time.dart';

class Yukleniyor extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Yukleniyor> {
  String zaman = "Yükleniyor";
  void setupWordTime() async {
    WordTime nesne =
        WordTime(konum: "Berlin", bayrak: "germany.png", url: "Europe/Berlin");

    await nesne.getZaman();
    // print(nesne);
    setState(() {
      zaman = nesne.zaman;
    });
  }

  @override
  void initState() {
    setupWordTime();
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
          "Dünya Saatleri",
          style: TextStyle(color: Color.fromRGBO(28, 20, 13, 1)),
        )),
        elevation: 0.0,
      ),
      body: Center(
        child: Text("$zaman"),
      ),
    );
  }
}
