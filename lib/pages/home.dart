import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map routeVeriler = {};
  String bgResim;

  @override
  Widget build(BuildContext context) {
    routeVeriler = routeVeriler.isNotEmpty
        ? routeVeriler.isEmpty
        : ModalRoute.of(context).settings.arguments;

    bgResim = routeVeriler["gunZaman"] ? "daytime.jpg" : "night.jpg";
    print(routeVeriler);
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 233, 225, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(203, 232, 107, 1),
        title: Text("Dünya Saatleri",
            style: TextStyle(color: Color.fromRGBO(28, 20, 13, 1))),
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/$bgResim"), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    dynamic sonuc =
                        await Navigator.pushNamed(context, "/konum");
                    if (sonuc != null) {
                      setState(() {
                        routeVeriler = {
                          "zaman": sonuc["zaman"],
                          "konum": sonuc["konum"],
                          "bayrak": sonuc["bayrak"],
                          "gunZaman": sonuc["gunZaman"],
                        };
                      });
                    }
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Konum Düzenle",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
              SizedBox(
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    routeVeriler["konum"],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        letterSpacing: 2.0),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    routeVeriler["zaman"],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60.0,
                        letterSpacing: 2.0),
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
