import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/home.dart';
import 'package:flutter_application_2/widgets/start.dart';
import 'package:flutter_application_2/widgets/userModel.dart';

int num;

class Ajout extends StatefulWidget {
  Ajout(int n) {
    num = n;
  }
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
  String nameAnnonce = '';
  String collection = "";
  void setupAnnonce() {
    if (num == 0) {
      nameAnnonce = 'e nourriture';
      collection = "nourriture";
    } else if (num == 1) {
      nameAnnonce = '\'électroménager';
      collection = "electromenager";
    } else if (num == 2) {
      nameAnnonce = 'e meubles';
      collection = "meubles";
    } else {
      nameAnnonce = 'e type Autre';
      collection = "autre";
    }
  }

  @override
  Widget build(BuildContext context) {
    setupAnnonce();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Ajouter une annonce d${nameAnnonce}',
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
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
                      decoration: InputDecoration(
                          hintText: 'Entrez un titre',
                          border: OutlineInputBorder()),
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
                      maxLines: 5,
                      onChanged: (value) =>
                          setState(() => _description = value),
                      validator: (value) =>
                          value.length < 1 ? 'Entrez un titre' : null,
                      decoration: InputDecoration(
                          hintText: 'Entrez une description',
                          border: OutlineInputBorder()),
                    )),
                ElevatedButton(
                  onPressed: () {
                    firestoreInstance
                        .collection(collection)
                        .doc("$_titre")
                        .set({
                      "titre": "$_titre",
                      "description": "$_description",
                    });
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return new Home();
                    }));
                  },
                  child: Text('CONTINUER'),
                ),
              ],
            ))));
  }
}
