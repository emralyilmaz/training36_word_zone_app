import 'package:flutter/material.dart';
import 'package:training36_word_zone_app/services/word_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "konum": nesne.konum,
      "bayrak": nesne.bayrak,
      "zaman": nesne.zaman,
      "gunZaman": nesne.gunZaman
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
      body: Center(
        child: SpinKitRotatingCircle(
          color: Color.fromRGBO(203, 232, 107, 1),
          size: 90.0,
        ),
      ),
    );
  }
}
