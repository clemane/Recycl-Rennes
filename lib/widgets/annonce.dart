import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'Autre_Data.dart';
import 'Meuble_Data.dart';
import 'Electro_Data.dart';
import 'TripleString.dart';

TripleString n;
int dat;

class Annonce extends StatefulWidget {
  Annonce(TripleString annonce, int data) {
    n = annonce;
    dat = data;
  }

  @override
  _AnnonceState createState() => new _AnnonceState();
}

class _AnnonceState extends State<Annonce> {
  List<String> listAdd = [];
  List<dynamic> responseList = [];
  void getAnnonce() {
    if (dat == 0) {
      responseList = FOOD_DATA;
    } else if (dat == 1) {
      responseList = ELECTRO_DATA;
    } else if (dat == 2) {
      responseList = MEUBLE_DATA;
    } else {
      responseList = AUTRE_DATA;
    }
    responseList.forEach((post) {
      if (post["name"] == n) {
        listAdd.add(post["name"]);
        listAdd.add(post["brand"]);
        listAdd.add(post["price"]);
        listAdd.add(post["image"]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getAnnonce();
    String name = n.x;
    String brand = n.y;
    String price = n.z;

    return new Scaffold(
        appBar: new AppBar(
          title: Text("Annonce $name"),
        ),
        body: new Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Image.asset(
                "assets/images/cross.png",
                height: MediaQuery.of(context).size.height / 2,
                width: 600,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Description : $brand"),
              SizedBox(
                height: 20,
              ),
              Text("Adresse du donateur : $price"),
            ],
          ),
        ));
  }
}
