import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tfg_eco/Arguments/ScreenArguments.dart';
import 'package:flutter_icons/flutter_icons.dart';

// ignore: must_be_immutable
class HomeTab extends StatefulWidget {
  ScreenArguments arguments;

  HomeTab(ScreenArguments arguments) {
    this.arguments = arguments;
  }
  @override
  _HomeTabState createState() => _HomeTabState(this.arguments);
}

class _HomeTabState extends State<HomeTab> {
  ScreenArguments user;

  _HomeTabState(ScreenArguments user) {
    this.user = user;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            height: 200,
            width: 380,
            child: Card(
              color: Color.fromRGBO(250, 250, 250, 0.8),
              elevation: 5,
              borderOnForeground: true,
              shadowColor: Colors.black,
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                                    child: Icon(Icons.person),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      user.Nome,
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: Colors.black,
                                              blurRadius: 0.7)
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
                          Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        (DateTime.now()
                                                        .difference(
                                                            DateTime.parse(user
                                                                .Data_de_nascimento))
                                                        .inDays ~/
                                                    365)
                                                .toString() +
                                            ' anos',
                                        style: TextStyle(
                                          shadows: [
                                            Shadow(
                                                color: Colors.black,
                                                blurRadius: 0.7)
                                          ],
                                          fontFamily: 'Montserrat',
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black26,
                      thickness: 1.2,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                            child: Icon(FlutterIcons.water_mco),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Tipo sanguíneo : ${user.Tipo}",
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
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                                    child: Icon(FlutterIcons.weight_mco),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Peso: ${user.Peso}kg",
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: Colors.black,
                                              blurRadius: 0.7)
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
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.fromLTRB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Icon(FlutterIcons.ruler_ent)),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Altura: ${user.Altura} cm", //"user.Nome",
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: Colors.black,
                                              blurRadius: 0.7)
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            height: 160,
            width: 380,
            child: Card(
              color: Color.fromRGBO(250, 250, 250, 0.8),
              elevation: 5,
              borderOnForeground: true,
              shadowColor: Colors.black,
              child: Container(
                padding: EdgeInsets.all(5.0),
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
                                crossAxisAlignment: CrossAxisAlignment.baseline,
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
                              "Ainda faltam 5000 passos para o objetivo diário", //"user.Nome",
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
        ],
      ),
    );
  }
}
