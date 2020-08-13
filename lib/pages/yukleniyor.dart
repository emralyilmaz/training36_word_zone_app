import 'package:flutter/material.dart';

class Yukleniyor extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Yukleniyor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dünya Saatleri"),
      ),
      body: SafeArea(child: Text("Yukleniyor")),
    );
  }
}
