import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_tfg_eco/Arguments/ScreenArguments.dart';
import 'package:flutter_app_tfg_eco/Home/alterar.dart';
import 'package:flutter_app_tfg_eco/Home/graphTab.dart';
import 'dart:convert';
import 'homeTab.dart';

Future<Post> getSVMData() async {
  var response = await http
      .get(Uri.encodeFull("http://10.0.2.2:8000/get-svm/9"), headers: {
    "Content-Type": "application/json",
    "Accept": "application/json",
  });

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Falha ao carregar um post');
  }
}

class Post {
  final String personID;
  final List<dynamic> data;

  Post({this.personID, this.data});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      personID: json['personID'],
      data: json['data'],
    );
  }
}

// ignore: must_be_immutable
class Home extends StatelessWidget {
  ScreenArguments arguments;
  final Future<Post> post = getSVMData();
  Home(ScreenArguments arguments) {
    this.arguments = arguments;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(127, 181, 190, 1),
            bottom: TabBar(
              labelColor: Color.fromRGBO(250, 250, 250, 1),
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.home,
                  size: 30.0,
                  color: Colors.white,
                )),
                Tab(
                    icon: Icon(
                  Icons.insert_chart_outlined,
                  size: 30.0,
                  color: Colors.white,
                )),
                Tab(
                    icon: Icon(
                  Icons.settings,
                  size: 30.0,
                  color: Colors.white,
                )),
              ],
            ),
            title: Text(
              "Veio's Fall",
              style: TextStyle(
                  fontFamily: "Cookie",
                  fontSize: 45.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  shadows: [
                    Shadow(color: Colors.white, blurRadius: 5.0),
                  ]),
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              HomeTab(arguments),
              GraphTab(arguments.Nome, post),
              AlterarPage(arguments),
            ],
          ),
        ),
      ),
    );
  }
}
