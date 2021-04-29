import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Votre profil'),
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
              padding: EdgeInsets.only(top: 20.0),
              child: CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('assets/images/LEMANE.jpg'),
              )),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
          ),
          Text(
            'MR LEMANE',
            style: TextStyle(fontSize: 25),
          )
        ]),
      ),
    );
  }
}
