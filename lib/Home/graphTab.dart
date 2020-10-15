import 'dart:async';
import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> getSVMData() async {
  var response = await http
      .get(Uri.encodeFull("http://127.0.0.1:8000/get-svm/2"), headers: {
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
  final int personID;
  final List<int> data;

  Post({this.personID, this.data});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      personID: json['personID'],
      data: json['data'],
    );
  }
}

class GraphTab extends StatefulWidget {
  @override
  _GraphTabState createState() => _GraphTabState();
}

class _GraphTabState extends State<GraphTab> {
  final Future<Post> post = getSVMData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Post>(
          future: post,
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("id:" +
                    snapshot.data.personID.toString() +
                    '\n\n data:' +
                    snapshot.data.data.toString()),
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
