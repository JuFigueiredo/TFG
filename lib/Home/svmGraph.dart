import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_tfg_eco/grafico.dart';
import 'home.dart';

import 'package:flutter_app_tfg_eco/Home/ScreenOrientation.dart';

// ignore: must_be_immutable
class SvmGraph extends StatefulWidget {
  Future<Post> svm;

  SvmGraph(Future<Post> svm) : super() {
    this.svm = svm;
  }
  @override
  _SvmGraphState createState() => _SvmGraphState(this.svm);
}

class _SvmGraphState extends State<SvmGraph>
    with PortraitStatefulModeMixin<SvmGraph> {
  Future<Post> svm;

  _SvmGraphState(Future<Post> svm) {
    this.svm = svm;
  }

  @override
  Widget build(BuildContext context) {
    super.buildLandscape(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(127, 181, 190, 1),
        title: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Elderly",
            style: TextStyle(
                fontFamily: "Cookie",
                fontSize: 45.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                shadows: [
                  Shadow(color: Colors.white, blurRadius: 5.0),
                ]),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                child: Text(
                  "Previsão dos movimentos a partir de uma Máquina de Vetor de Suporte (SVM)",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    shadows: [Shadow(color: Colors.black, blurRadius: 0.7)],
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              FutureBuilder<Post>(
                future: svm,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    SimpleLineChart svm =
                        new SimpleLineChart.withData(snapshot.data.data);
                    return Container(
                      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                      height: 350,
                      width: MediaQuery.of(context).size.width * 0.9,
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
                      return Container(
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        child: Text(
                          "${snapshot.error}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30.0),
                        ),
                      );
                    }
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
