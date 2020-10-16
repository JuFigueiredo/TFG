import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_tfg_eco/grafico.dart';

import 'home.dart';

// ignore: must_be_immutable
class GraphTab extends StatefulWidget {
  String nome = "";
  Future<Post> post;

  GraphTab(String nome, Future<Post> post) {
    this.nome = nome;
    this.post = post;
  }
  @override
  _GraphTabState createState() => _GraphTabState(this.nome, this.post);
}

class _GraphTabState extends State<GraphTab> {
  String nome;
  Future<Post> post;

  _GraphTabState(String nome, Future<Post> post) {
    this.nome = nome;
    this.post = post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Post>(
          future: post,
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              SimpleLineChart svm =
                  new SimpleLineChart.withData(snapshot.data.data, nome, 'SVM');
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: svm,
              );
            } else {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
