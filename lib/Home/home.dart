import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homeTab.dart';

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

class Home extends StatelessWidget {
  ScreenArguments arguments;

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
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
