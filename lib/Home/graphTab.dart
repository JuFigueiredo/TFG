import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_tfg_eco/grafico.dart';

import 'home.dart';

import 'package:flutter_app_tfg_eco/Home/ScreenOrientation.dart';

// ignore: must_be_immutable
class GraphTab extends StatefulWidget {
  String nome = "";
  Future<Post> post;

  GraphTab(String nome, Future<Post> post) : super() {
    this.nome = nome;
    this.post = post;
  }
  @override
  _GraphTabState createState() => _GraphTabState(this.nome, this.post);
}

class _GraphTabState extends State<GraphTab>
    with PortraitStatefulModeMixin<GraphTab> {
  String nome;
  Future<Post> post;

  _GraphTabState(String nome, Future<Post> post) {
    this.nome = nome;
    this.post = post;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FutureBuilder<Post>(
        future: post,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            SimpleLineChart svm =
                new SimpleLineChart.withData(snapshot.data.data);
            return Container(
              padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
              height: 300,
              width: 380,
              child: Card(
                color: Color.fromRGBO(250, 250, 250, 0.8),
                elevation: 5,
                borderOnForeground: true,
                shadowColor: Colors.black,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  child: svm,
                ),
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
