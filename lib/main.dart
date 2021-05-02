import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'widgets/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp();

  runApp(new MyApp());
}
