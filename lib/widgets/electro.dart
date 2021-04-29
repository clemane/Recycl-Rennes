import 'package:flutter/material.dart';

class Electro extends StatefulWidget {
  @override
  _ElectroState createState() => new _ElectroState();
}

class _ElectroState extends State<Electro> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Annonce Electroménager'),
        actions: [
          Icon(Icons.settings),
          Padding(
            padding: EdgeInsets.only(right: 10),
          ),
        ],
      ),
      body: new Center(
        child: new Column(children: <Widget>[
          Container(
            height: 75.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
          )
        ]),
      ),
    );
  }
}
