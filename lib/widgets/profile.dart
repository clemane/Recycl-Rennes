import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/start.dart';
import 'profile_data.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => new _ProfileState();
}

void getProfilData() {
  List<dynamic> profilList = PROFIL_DATA;
  List<Widget> listItems = [];
  profilList.forEach((post) {
    listItems.add(
      Center(
        child: new Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 20.0),
                child: CircleAvatar(
                  radius: 70.0,
                  backgroundImage: AssetImage("assets/images/${post["image"]}"),
                )),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
            ),
            Text(
              post["name"],
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  });
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Votre profil'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              print('Déconnexion...');
              Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context) {
                return Start();
              }));
            },
          ),
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
