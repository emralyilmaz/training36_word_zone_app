import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Yukleniyor extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Yukleniyor> {
  void getZaman() async {
    Response res =
        await get("http://worldtimeapi.org/api/timezone/Europe/Istanbul");
    Map veri = jsonDecode(res.body);
    print(veri);
    String dateTime = veri["datetime"];
    String offset = veri["utc_offset"];

    print(dateTime);
    print(offset);
  }

  @override
  void initState() {
    getZaman();
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
        child: Text("Yükleniyor"),
      ),
    );
  }
}
