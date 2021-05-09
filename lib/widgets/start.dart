import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/home.dart';
import 'inscription.dart';
import 'connexion.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Recycl'Rennes",
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return new Inscription();
                }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'S\'INSCRIRE',
                  style: TextStyle(fontSize: 18),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context) {
                return new Connexion();
              }));
            },
            child: Text(
              'SE CONNECTER',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    ))));
  }
}
