import 'package:flutter/material.dart';

class Konum extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Konum> {
  void getVeri() async {
    String isim = await Future.delayed(Duration(seconds: 2), () {
      return "Emral Yılmaz";
    });

    String yas = await Future.delayed(Duration(seconds: 3), () {
      return "27";
    });

    print("$isim ve $yas");
  }

  @override
  void initState() {
    getVeri();
    print("mesaj");
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
      body: Center(
        child: Text("Konum"),
      ),
    );
  }
}
