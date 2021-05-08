import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/home.dart';
import 'package:flutter_application_2/widgets/start.dart';
import 'package:flutter_application_2/widgets/userModel.dart';

class Ajout extends StatefulWidget {
  @override
  _AjoutState createState() => _AjoutState();
}

class _AjoutState extends State<Ajout> {
  bool secret = true;
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  final GlobalKey<FormState> titleKey = GlobalKey<FormState>();
  final GlobalKey<FormState> descriptionKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  UserModel userModel;

  String _titre = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return Start();
                    }));
                  }),
              title: Text('Ajouter une annonce'),
            ),
            body: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Titre de l\'annonce',
                  style: TextStyle(fontSize: 20),
                ),
                Form(
                    key: titleKey,
                    child: TextFormField(
                      onChanged: (value) => setState(() => _titre = value),
                      validator: (value) =>
                          value.length < 1 ? 'Entrez un titre' : null,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Description de l\'annonce',
                  style: TextStyle(fontSize: 20),
                ),
                Form(
                    key: descriptionKey,
                    child: TextFormField(
                      maxLines: 8,
                      onChanged: (value) =>
                          setState(() => _description = value),
                      validator: (value) =>
                          value.length < 1 ? 'Entrez un titre' : null,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),
              ],
            ))));
  }
}
