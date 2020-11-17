import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'home_page.dart';
import 'rna_graph.dart';
import 'svm_graph.dart';

/// Tab da Tela Principal
// ignore: must_be_immutable
class HomeTab extends StatefulWidget {
  /// SVM
  Future<Post> localSVM;

  /// RNA
  Future<Post> localRNA;

  ///Construtor
  HomeTab(this.localSVM, this.localRNA);
  @override
  _HomeTabState createState() => _HomeTabState(localSVM, localRNA);
}

class _HomeTabState extends State<HomeTab> {
  Future<Post> localSVM;
  Future<Post> localRNA;

  _HomeTabState(this.localSVM, this.localRNA);

  @override
  Widget build(BuildContext context) {
    var difference =
        (DateTime.now().difference(DateTime.parse(user.birthDate)).inDays ~/
            365);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
            child: Card(
              color: Color.fromRGBO(250, 250, 250, 0.8),
              elevation: 5,
              borderOnForeground: true,
              shadowColor: Colors.black,
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                height: 240,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                          child: Icon(Icons.person),
                        ),
                        Flexible(
                          child: Text(
                            user.name,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 0.7)
                              ],
                              fontFamily: 'Montserrat',
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
                          child: Text(
                            "$difference anos",
                            style: TextStyle(
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 0.7)
                              ],
                              fontFamily: 'Montserrat',
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black26,
                      thickness: 1.2,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 5.0),
                          child: Icon(FlutterIcons.water_mco),
                        ),
                        Text(
                          "Tipo sanguíneo : ${user.bloodType}",
                          style: TextStyle(
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 0.7)
                            ],
                            fontFamily: 'Montserrat',
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 10.0),
                          child: Icon(FlutterIcons.weight_mco),
                        ),
                        Text(
                          "Peso: ${user.weigth}kg",
                          style: TextStyle(
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 0.7)
                            ],
                            fontFamily: 'Montserrat',
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Icon(FlutterIcons.ruler_ent),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                          child: Text(
                            "Altura: ${user.height} cm",
                            style: TextStyle(
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 0.7)
                              ],
                              fontFamily: 'Montserrat',
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
            child: Card(
              color: Color.fromRGBO(250, 250, 250, 0.8),
              elevation: 5,
              borderOnForeground: true,
              shadowColor: Colors.black,
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                height: 150,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(0.0, 0, 3.0, 0),
                                    child: Text(
                                      "0",
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: Colors.black,
                                              blurRadius: 0.1)
                                        ],
                                        fontFamily: 'Montserrat',
                                        fontSize: 45.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(3.0, 0, 0, 0),
                                    child: Text(
                                      "passos",
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: Colors.black,
                                              blurRadius: 0.1)
                                        ],
                                        fontFamily: 'Montserrat',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  width: 4,
                                  color: Color.fromRGBO(127, 181, 190, 1),
                                )),
                            child: Icon(
                              Icons.directions_walk,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 0, 20.0, 0.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 0, 10.0, 0.0),
                            child: Text(
                              "Ainda faltam 5000 passos para o objetivo diário",
                              style: TextStyle(
                                shadows: [
                                  Shadow(color: Colors.black, blurRadius: 0.7)
                                ],
                                fontFamily: 'Montserrat',
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
            child: RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              textColor: Colors.white,
              padding: EdgeInsets.all(0.0),
              child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.center,
                height: 80.0,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color.fromRGBO(246, 126, 125, 1),
                      Color.fromRGBO(246, 126, 125, 0.9),
                      Color.fromRGBO(246, 126, 125, 1),
                    ],
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      AntDesign.barchart,
                      color: Colors.black,
                      size: 32,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Gráfico SVM",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SvmGraph(localSVM)))
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
            child: RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              textColor: Colors.white,
              padding: EdgeInsets.all(0.0),
              child: Container(
                alignment: Alignment.center,
                height: 80.0,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color.fromRGBO(245, 162, 93, 1),
                      Color.fromRGBO(245, 162, 93, 0.8),
                      Color.fromRGBO(245, 162, 93, 1),
                    ],
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      AntDesign.barchart,
                      color: Colors.black,
                      size: 32,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Gráfico RNA",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RnaGraph(localRNA)))
              },
            ),
          ),
        ],
      ),
    );
  }
}
