import 'package:flutter/material.dart';
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
        actions: <Widget>[
          Column(
            children: <Widget>[
              new Text("Nourriture"),
              new Text("Electroménager"),
            ],
          ),
        ],
        centerTitle: true,
        elevation: 20.0,
        backgroundColor: Colors.orangeAccent,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
        child: new Container(
          color: Colors.blue,
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.height / 10,
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
