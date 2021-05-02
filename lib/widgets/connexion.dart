import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/home.dart';
import 'profile.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  bool secret = true;
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email;

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
          Form(
            key: formKey,
            child: TextFormField(
              onChanged: (value) => setState(() => email = value),
              validator: (value) => value.isEmpty || !emailRegex.hasMatch(value)
                  ? 'Merci de rentrer un email valide'
                  : null,
              decoration: InputDecoration(
                  hintText: 'Entrez votre email', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: secret,
            decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () => setState(() => secret = !secret),
                  child: Icon(secret ? Icons.visibility : Icons.visibility_off),
                ),
                hintText: 'Entrez votre mot de passe',
                border: OutlineInputBorder()),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState.validate())
                Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return new Home();
                }));
            },
            child: Text('CONTINUER'),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    ))));
  }
}
