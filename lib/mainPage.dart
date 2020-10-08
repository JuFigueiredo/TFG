import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "dart:ui";
import "package:flutter/widgets.dart";

class ScreenArguments {
  // ignore: non_constant_identifier_names
  final String Altura;
  // ignore: non_constant_identifier_names
  final String Message;
  // ignore: non_constant_identifier_names
  final String CEP;
  // ignore: non_constant_identifier_names
  final String Celular;
  // ignore: non_constant_identifier_names
  final String Celular_Emergencia;
  // ignore: non_constant_identifier_names
  final String Cidade;
  // ignore: non_constant_identifier_names
  final String Complemento;
  // ignore: non_constant_identifier_names
  final String Data_de_nascimento;
  // ignore: non_constant_identifier_names
  final String Estado;
  // ignore: non_constant_identifier_names
  final String Nome;
  // ignore: non_constant_identifier_names
  final String Nome_Emergencia;
  // ignore: non_constant_identifier_names
  final String Numero;
  // ignore: non_constant_identifier_names
  final String Peso;
  // ignore: non_constant_identifier_names
  final String Rua;
  // ignore: non_constant_identifier_names
  final String Tipo;

  ScreenArguments(
    this.Altura,
    this.Message,
    this.CEP,
    this.Celular,
    this.Celular_Emergencia,
    this.Cidade,
    this.Complemento,
    this.Data_de_nascimento,
    this.Estado,
    this.Nome,
    this.Nome_Emergencia,
    this.Numero,
    this.Peso,
    this.Rua,
    this.Tipo,
  );
}

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  ScreenArguments arguments;

  MainPage(ScreenArguments arguments) {
    this.arguments = arguments;
  }
  @override
  _MainPageState createState() => _MainPageState(this.arguments);
}

class _MainPageState extends State<MainPage> {
  ScreenArguments user;

  _MainPageState(ScreenArguments user) {
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          stops: [
                        0.15,
                        0.15
                      ],
                          colors: [
                        Color.fromRGBO(127, 181, 190, 1),
                        Colors.white
                      ])),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0.0, 0.0, 0.0, 0.0),
                                          child: FlatButton(
                                            onPressed: () {
                                              //Preencher código de home
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0.0, 0.0, 70.0, 0.0),
                                              child: Icon(
                                                Icons.home,
                                                color: Colors.black,
                                                size: 32.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 108.0, 0.0),
                                        child: Text(
                                          "Pagina Principal",
                                          style: TextStyle(
                                            fontFamily: 'Cookie',
                                            fontSize: 35.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(60.0, 0.0, 10.0, 30.0),
                                child: Container(
                                  height: 180,
                                  width: 350,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                    child: Card(
                                      color: Color.fromRGBO(238, 238, 238, 1),
                                      shadowColor: Colors.black,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      margin: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10.0, 20.0, 0.0, 0.0),
                                                child: Text(
                                                  user.Nome,
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 22.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    45.0, 20.0, 0.0, 0.0),
                                                child: Text(
                                                  (DateTime.now()
                                                                  .difference(DateTime
                                                                      .parse(user
                                                                          .Data_de_nascimento))
                                                                  .inDays ~/
                                                              365)
                                                          .toString() +
                                                      ' anos',
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 22.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0.0, 0.0, 0.0, 0.0),
                                            child: const Divider(
                                              color: Color.fromRGBO(
                                                  192, 206, 209, 0.7),
                                              height: 15,
                                              thickness: 1,
                                              indent: 0,
                                              endIndent: 0,
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10.0, 17.0, 0.0, 0.0),
                                                child: Text(
                                                  "Tipo sanguíneo : ${user.Tipo}",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 22.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10.0, 15.0, 0.0, 0.0),
                                                child: Text(
                                                  "Peso: ${user.Peso}kg",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 22.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    45.0, 15.0, 0.0, 0.0),
                                                child: Text(
                                                  'Altura: ${user.Altura} cm',
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 22.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(60.0, 0.0, 10.0, 0.0),
                                child: Container(
                                  height: 180,
                                  width: 350,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                    child: Card(
                                      color: Color.fromRGBO(238, 238, 238, 1),
                                      shadowColor: Colors.black,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      margin: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10.0, 20.0, 0.0, 20.0),
                                                child: Text(
                                                    "Contador de passos:",
                                                    style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 25.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      decoration: TextDecoration
                                                          .underline,
                                                    )),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    260.0, 10.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.directions_walk,
                                                  size: 50,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20.0, 15.0, 90.0, 0.0),
                                            child: Text(
                                              "155 passos hoje.",
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(60.0, 30.0, 10.0, 0.0),
                                child: Container(
                                  height: 180,
                                  width: 350,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                    child: Card(
                                      color: Color.fromRGBO(238, 238, 238, 1),
                                      shadowColor: Colors.black,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      margin: EdgeInsets.all(10.0),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Histórico de quedas:",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 25.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    25.0, 36.0, 0.0, 0.0),
                                                child: Text(
                                                  "Jan:",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    25.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  "Fev:",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    25.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  "Mar:",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    25.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  "Abr:",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    25.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  "Mai:",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    25.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  "Jun:",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    180.0, 36.0, 0.0, 0.0),
                                                child: Text(
                                                  "Jul:",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    180.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  "Ago:",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    180.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  "Set:",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    180.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  "Out:",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    180.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  "Nov:",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    180.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  "Dez:",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 50.0, 0.0),
                                child: FlatButton(
                                  onPressed: () {
                                    //Preencher código de home
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 600.0, 50.0, 0.0),
                                    child: Icon(
                                      Icons.settings,
                                      color: Colors.black,
                                      size: 32.0,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 40.0, 0.0),
                                child: FlatButton(
                                  onPressed: () {
                                    //Preencher código de saída
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 0.0, 57.0, 0.0),
                                    child: Icon(
                                      Icons.exit_to_app,
                                      color: Colors.black,
                                      size: 32.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ))));
  }
}
