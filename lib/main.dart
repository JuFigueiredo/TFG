import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'views/login/loading_app.dart';
import 'views/login/login_page.dart';

void main() {
  runApp(App());
}

/// Main
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
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              supportedLocales: [const Locale('pt', 'BR')],
              home: LoginPage(),
            );
          }
          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: [const Locale('pt', 'BR')],
            home: LoadingApp(),
          );
        });
  }
}
