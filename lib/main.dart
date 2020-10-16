import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_app_tfg_eco/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return MaterialApp(
            home: LoginPage(),
          );
        });
  }
}
