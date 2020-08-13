import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Yukleniyor extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Yukleniyor> {
  void getVeri() async {
    Response res = await get("https://jsonplaceholder.typicode.com/albums/1");
    //  print(res.body);
    Map veri = jsonDecode(res.body);
    print(veri);
    print(veri["userId"]);
    print(veri["title"]);
  }

  @override
  void initState() {
    getVeri();
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
