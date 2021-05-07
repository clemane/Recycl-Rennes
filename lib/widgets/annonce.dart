import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'Autre_Data.dart';
import 'Meuble_Data.dart';
import 'Electro_Data.dart';

String n;
int dat;

class Annonce extends StatefulWidget {
  Annonce(String annonce, int data) {
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
    String name = listAdd[0];
    String brand = listAdd[1];
    String price = listAdd[2];
    String img = listAdd[3];

    return new Scaffold(
        appBar: new AppBar(
          title: Text("Annonce $name"),
        ),
        body: new Container(
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/$img"),
              SizedBox(
                height: 20,
              ),
              Text("Nom du donateur : $brand"),
              SizedBox(
                height: 20,
              ),
              Text("Adresse mail du donateur : $price"),
            ],
          ),
        ));
  }
}
