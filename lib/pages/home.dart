import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map routeVeriler = {};

  @override
  Widget build(BuildContext context) {
    routeVeriler = ModalRoute.of(context).settings.arguments;
    print(routeVeriler);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(203, 232, 107, 1),
        title: Text("Dünya Saatleri",
            style: TextStyle(color: Color.fromRGBO(28, 20, 13, 1))),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/konum");
                },
                icon: Icon(Icons.edit_location),
                label: Text("Konum Düzenle"))
          ],
        ),
      )),
    );
  }
}
