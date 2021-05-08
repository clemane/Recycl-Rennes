import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/home.dart';
import 'package:flutter_application_2/widgets/start.dart';
import 'package:flutter_application_2/widgets/userModel.dart';

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  bool secret = true;
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  UserModel userModel;

  String _email = '';
  String _password = '';
  String _pseudo = '';

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
            ),
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
                  Form(
                    child: TextFormField(
                      onChanged: (value) => setState(() => _pseudo = value),
                      validator: (value) => value.isEmpty
                          ? 'Merci de rentrer un nom d\'utilisateur'
                          : null,
                      decoration: InputDecoration(
                          hintText: 'Entrez votre nom d\'utilisateur',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: emailKey,
                    child: TextFormField(
                      onChanged: (value) => setState(() => _email = value),
                      validator: (value) =>
                          value.isEmpty || !emailRegex.hasMatch(value)
                              ? 'Merci de rentrer un email valide'
                              : null,
                      decoration: InputDecoration(
                          hintText: 'Entrez votre email',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: passwordKey,
                      child: TextFormField(
                        onChanged: (value) => setState(() => _password = value),
                        validator: (value) => value.length < 6
                            ? 'Entrez un mot de passe d\'au moins 6 caractères'
                            : null,
                        obscureText: secret,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () => setState(() => secret = !secret),
                              child: Icon(secret
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            hintText: 'Entrez votre mot de passe',
                            border: OutlineInputBorder()),
                      )),
                  ElevatedButton(
                    onPressed: () {
                      if (emailKey.currentState.validate() &&
                          passwordKey.currentState.validate()) {
                        auth.createUserWithEmailAndPassword(
                            email: _email, password: _password);
                        firestoreInstance
                            .collection("users")
                            .doc("$_email")
                            .set({
                          "email": "$_email",
                          "name": "$_pseudo",
                        });
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (BuildContext context) {
                          return new Home();
                        }));
                      }
                    },
                    child: Text('CONTINUER'),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ))));
  }
}
