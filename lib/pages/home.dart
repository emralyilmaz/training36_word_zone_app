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
      backgroundColor: Color.fromRGBO(242, 233, 225, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(203, 232, 107, 1),
        title: Text("Dünya Saatleri",
            style: TextStyle(color: Color.fromRGBO(28, 20, 13, 1))),
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, "/konum");
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text(
                    "Konum Düzenle",
                    style: TextStyle(color: Color.fromRGBO(28, 20, 13, 1)),
                  )),
              SizedBox(
                height: 100.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    routeVeriler["konum"],
                    style: TextStyle(fontSize: 25.0, letterSpacing: 2.0),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    routeVeriler["zaman"],
                    style: TextStyle(fontSize: 60.0, letterSpacing: 2.0),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
