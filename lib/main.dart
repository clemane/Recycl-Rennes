import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Recycl'Rennes",
      theme: new ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: new Home(),
    );
  }
}

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
        leading: new Icon(Icons.account_box),
        actions: <Widget>[
          new Text("Nourriture"),
          new Text("Electroménager"),
        ],
        centerTitle: true,
        elevation: 20.0,
        backgroundColor: Colors.black,
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
}
