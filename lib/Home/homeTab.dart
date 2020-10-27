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
    print(user.Data_de_nascimento);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
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
                  crossAxisAlignment: CrossAxisAlignment.baseline,
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
                            "Juliana Figueiredo de Andrade",
                            // user.Nome,
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
                            (DateTime.now()
                                            .difference(DateTime.parse(
                                                user.Data_de_nascimento))
                                            .inDays ~/
                                        365)
                                    .toString() +
                                ' anos',
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
                          "Peso: ${user.Peso}kg",
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
                            "Altura: ${user.Altura} cm",
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
