import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/connexion.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Recycl'Rennes",
      theme: new ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: new Connexion(),
    );
  }
}
