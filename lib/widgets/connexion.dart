import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            "Recycl\'Rennes",
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Entrez votre email', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Entrez votre mot de passe',
                border: OutlineInputBorder()),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    )));
  }
}
