import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/user_model.dart';
import '../login/login_page.dart';
import 'home_tab.dart';
import 'update_page.dart';

/// Rota para o resultado da SVM no backend
Future<Post> getSVMData() async {
  var response = await http
      .get(Uri.encodeFull("http://192.168.0.152:8000/get-svm/18"), headers: {
    "Content-Type": "application/json",
    "Accept": "application/json",
  });

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Falha ao carregar um post');
  }
}

/// Rota para o resultado da RNA no backend
Future<Post> getRNAData() async {
  var response = await http
      .get(Uri.encodeFull("http://192.168.0.152:8000/get-rna/18"), headers: {
    "Content-Type": "application/json",
    "Accept": "application/json",
  });

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Falha ao carregar um post');
  }
}

/// Classe que recebe os dados do backend
class Post {
  /// Id do usuário
  final String personID;

  /// Resultado da IA
  final List<dynamic> data;

  /// Construtor
  Post({this.personID, this.data});

  ///Converte JSON em MAP
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      personID: json['personID'],
      data: json['data'],
    );
  }
}

/// Instancia Global do usuário
UserModel user;

// ignore: must_be_immutable
/// Page home
class Home extends StatefulWidget {
// ignore: must_be_immutable

  /// Construtor
  Home(UserModel u) {
    user = u;
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// Instância para a SVM
  final Future<Post> svm = getSVMData();

  /// Instância para a RNA
  final Future<Post> rna = getRNAData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(127, 181, 190, 1),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: IconButton(
                    icon: Icon(
                      Icons.logout,
                      size: 30.0,
                      color: Colors.black,
                    ),
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          ),
                        }),
              )
            ],
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
                  Icons.settings,
                  size: 30.0,
                  color: Colors.white,
                )),
              ],
            ),
            title: Text(
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
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              HomeTab(svm, rna),
              UpdatePage(),
            ],
          ),
        ),
      ),
    );
  }
}
