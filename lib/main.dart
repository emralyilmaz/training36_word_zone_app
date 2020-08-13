import 'package:flutter/material.dart';
import 'package:training36_word_zone_app/pages/konum_sec.dart';
import 'package:training36_word_zone_app/pages/yukleniyor.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
      //   home: Home(),
      initialRoute: "/",
      routes: {
        "/": (context) => Yukleniyor(),
        "/home": (context) => Home(),
        "/konum": (context) => Konum(),
      },
    ));
