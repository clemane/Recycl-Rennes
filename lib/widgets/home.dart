import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/bouffe.dart';
import 'package:flutter_application_2/widgets/electro.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Recycl'Rennes"),
        leading: new IconButton(
            icon: Icon(Icons.account_box),
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context) {
                return new Profile();
              }));
            }),
        centerTitle: true,
        elevation: 20.0,
        backgroundColor: Colors.orangeAccent,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        height: 75.0,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new IconButton(
                icon: Icon(Icons.food_bank, color: Colors.white, size: 50),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new Bouffe();
                  }));
                }),
            new IconButton(
                icon: Icon(Icons.home, color: Colors.white, size: 50),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new Electro();
                  }));
                }),
          ],
        ),
      ),
    );
  }

  void getNewScaffold() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return new Profile();
    }));
  }
}
