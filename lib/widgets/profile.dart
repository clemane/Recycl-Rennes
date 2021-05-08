import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/start.dart';
import 'profile_data.dart';
import 'package:firebase_core/firebase_core.dart';

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
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  CollectionReference users_collection = FirebaseFirestore.instance.collection('users');
  
  String current_name = '';
  void get_name() {
    users_collection.doc(firebaseUser.email)
      .get()
      .then((DocumentSnapshot docsnap) {
      if (docsnap.exists) {
        current_name = docsnap['name'];
      }
      else {
        print('Document doesn\'t exist!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    get_name();
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
            current_name,
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            firebaseUser.email,
            style: TextStyle(fontSize: 25),
          )
        ]),
      ),
    );
  }
}
