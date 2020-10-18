import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_app_tfg_eco/loadingApp.dart';
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
          if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              home: LoginPage(),
            );
          }
          return MaterialApp(
            home: LoadingApp(),
          );
        });
  }
}
