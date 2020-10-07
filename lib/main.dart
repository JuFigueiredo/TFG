import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_app_tfg_eco/alterar.dart';
import 'package:flutter_app_tfg_eco/mainPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_gradient/linear_gradient.dart';
import 'package:flutter_app_tfg_eco/mainPage.dart';
import 'package:flutter_app_tfg_eco/login.dart';
import 'package:flutter_app_tfg_eco/cadastro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'banco.dart';

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
        }

    );
  }
}



