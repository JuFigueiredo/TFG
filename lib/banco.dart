import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Classe que armazena o
class BancoPage extends StatefulWidget {
  @override
  _BancoPageState createState() => _BancoPageState();
}

class _BancoPageState extends State<BancoPage> {
  TextEditingController phoneController = TextEditingController();

  // ignore: deprecated_member_use
  final firestoreInstance = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Container(
            height: constraints.maxHeight,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      "assets/images/wallpaperOld.jpeg",
                    ),
                    fit: BoxFit.cover,
                  )),
                ),
                Opacity(
                  child: Image.asset(
                    "assets/images/bgwhite.jpg",
                    fit: BoxFit.cover,
                    // width: size.width,
                    //height: size.height,
                  ),
                  opacity: 0.6,
                ),
                SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 70.0),
                        child: Text(
                          "Elderly",
                          style: TextStyle(
                            fontFamily: 'Cookie',
                            fontSize: 80.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        )),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: FlatButton(
                        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                        onPressed: () {
                          firestoreInstance.collection("users").add({
                            "name": "john",
                            "age": 50,
                            "email": "example@example.com",
                            "address": {
                              "street": "street 24",
                              "city": "new york"
                            }
                          }).then((value) {
                            // ignore: deprecated_member_use
                            print(value.documentID);
                          });
                        },
                        textColor: Colors.black,
                        child: Text(
                          "Adiciona",
                          style: TextStyle(
                            fontFamily: 'Cookie',
                            fontSize: 40.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
