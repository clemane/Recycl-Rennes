import 'package:flutter/material.dart';

class Bouffe extends StatefulWidget {
  @override
  _BouffeState createState() => new _BouffeState();
}

class _BouffeState extends State<Bouffe> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Annonce Nourriture'),
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
