import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "dart:ui";

import "package:flutter/widgets.dart";
import 'package:flutter_app_tfg_eco/Arguments/ScreenArguments.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:masked_text/masked_text.dart';

import 'home.dart';

// ignore: must_be_immutable
class AlterarPage extends StatefulWidget {
  @override
  _AlterarPageState createState() => _AlterarPageState();
}

class _AlterarPageState extends State<AlterarPage> {
  // ignore: deprecated_member_use
  final firestoreInstance = Firestore.instance;

  //Itens do cadastro
  TextEditingController _cepController = TextEditingController();
  TextEditingController _ruaController = TextEditingController();
  TextEditingController _bairroController = TextEditingController();
  TextEditingController _numeroController = TextEditingController();
  TextEditingController _complementoController = TextEditingController();
  TextEditingController _cidadeController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _emergencyPhoneController = TextEditingController();
  TextEditingController _nomeEmergenciaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String _dropdownEstado = user.Estado;
    print("Cel: " + user.Numero);
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Color.fromRGBO(250, 250, 250, 0.9),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Alterar Dados",
                  style: GoogleFonts.getFont("Montserrat",
                      fontSize: 22.0,
                      letterSpacing: 0.5,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.3),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Text(
                  "CEP:",
                  style: GoogleFonts.getFont("Montserrat",
                      fontSize: 18.0, letterSpacing: 0.5),
                ),
              ),
              MaskedTextField(
                keyboardType: TextInputType.number,
                mask: "xxxxx-xxx",
                escapeCharacter: 'x',
                maskedTextFieldController: _cepController,
                maxLength: 9,
                inputDecoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: GoogleFonts.getFont("Montserrat",
                      fontSize: 15.0, letterSpacing: 0.5),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Text(
                  "Rua:",
                  style: GoogleFonts.getFont("Montserrat",
                      fontSize: 18.0, letterSpacing: 0.5),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _ruaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: GoogleFonts.getFont("Montserrat",
                      fontSize: 15.0, letterSpacing: 0.5),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Text(
                  "Bairro:",
                  style: GoogleFonts.getFont("Montserrat",
                      fontSize: 18.0, letterSpacing: 0.5),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _bairroController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: GoogleFonts.getFont("Montserrat",
                      fontSize: 15.0, letterSpacing: 0.5),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Número:",
                              style: GoogleFonts.getFont("Montserrat",
                                  fontSize: 18.0, letterSpacing: 0.5),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _numeroController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: GoogleFonts.getFont("Montserrat",
                                  fontSize: 15.0, letterSpacing: 0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Complemento:",
                              style: GoogleFonts.getFont("Montserrat",
                                  fontSize: 18.0, letterSpacing: 0.5),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _complementoController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: GoogleFonts.getFont("Montserrat",
                                  fontSize: 15.0, letterSpacing: 0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Cidade:",
                  style: GoogleFonts.getFont("Montserrat",
                      fontSize: 18.0, letterSpacing: 0.5),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _cidadeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: GoogleFonts.getFont("Montserrat",
                      fontSize: 15.0, letterSpacing: 0.5),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Estado:",
                  style: GoogleFonts.getFont("Montserrat",
                      fontSize: 18.0, letterSpacing: 0.5),
                ),
              ),
              Container(
                width: 400.0,
                height: 60.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black45)),
                child: DropdownButtonHideUnderline(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: DropdownButton<String>(
                      icon: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.keyboard_arrow_down),
                      ),
                      value: _dropdownEstado,
                      onChanged: (String newValue) {
                        _dropdownEstado = newValue;
                      },
                      items: <String>[
                        'Selecionar',
                        'Alagoas',
                        'Acre',
                        'Amapá',
                        'Amazonas',
                        'Bahia',
                        'Ceára',
                        'Distrito Federal',
                        'Espírito Santo',
                        'Goiás',
                        'Maranhão',
                        'Mato Grosso',
                        'Mato Grosso do Sul',
                        'Minas Gerais',
                        'Pará',
                        'Paraíba',
                        'Paraná',
                        'Pernambuco',
                        'Piauí',
                        'Rio de Janeiro',
                        'Rio Grande do Norte',
                        'Rio Grande do Sul',
                        'Rondônia',
                        'Roraima',
                        'Santa Catarina',
                        'São Paulo',
                        'Sergipe',
                        'Tocantins'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.getFont("Montserrat",
                                fontSize: 15.0,
                                letterSpacing: 0.5,
                                color: Colors.black45),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Peso (kg):",
                              style: GoogleFonts.getFont("Montserrat",
                                  fontSize: 18.0, letterSpacing: 0.5),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _pesoController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: GoogleFonts.getFont("Montserrat",
                                  fontSize: 15.0, letterSpacing: 0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Altura (cm):",
                              style: GoogleFonts.getFont("Montserrat",
                                  fontSize: 18.0, letterSpacing: 0.5),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _alturaController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: GoogleFonts.getFont("Montserrat",
                                  fontSize: 15.0, letterSpacing: 0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  "Contato de Emergência",
                  style: GoogleFonts.getFont("Montserrat",
                      fontSize: 22.0,
                      letterSpacing: 0.5,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.double,
                      decorationThickness: 1.3),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
                child: Text(
                  "Celular:",
                  style: GoogleFonts.getFont("Montserrat",
                      fontSize: 18.0, letterSpacing: 0.5),
                ),
              ),
              MaskedTextField(
                keyboardType: TextInputType.phone,
                maxLength: 15,
                maskedTextFieldController: _emergencyPhoneController,
                escapeCharacter: 'x',
                mask: "(xx) xxxxx-xxxx",
                inputDecoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: GoogleFonts.getFont("Montserrat",
                      fontSize: 15.0, letterSpacing: 0.5),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Text(
                  "Nome Completo:",
                  style: GoogleFonts.getFont("Montserrat",
                      fontSize: 18.0, letterSpacing: 0.5),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: _nomeEmergenciaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: GoogleFonts.getFont("Montserrat",
                      fontSize: 15.0, letterSpacing: 0.5),
                ),
              ),
              Container(
                height: 85.0,
                width: 400.0,
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                child: RaisedButton(
                  color: Color.fromRGBO(44, 187, 101, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () async {
                    await firestoreInstance
                        .collection("Usuarios")
                        .doc(user.Celular.replaceAll("(", "")
                            .replaceAll(")", "")
                            .replaceAll("-", "")
                            .replaceAll(" ", ""))
                        .update({
                      "CEP": _cepController.text == null ||
                              _cepController.text == ""
                          ? user.CEP
                          : _cepController.text,
                      "Rua": _ruaController.text == null ||
                              _ruaController.text == ""
                          ? user.Rua
                          : _ruaController.text,
                      "Bairro": _bairroController.text == null ||
                              _bairroController.text == ""
                          ? user.Message
                          : _bairroController.text,
                      'Numero': _numeroController.text == null ||
                              _numeroController.text == ""
                          ? user.Numero
                          : _numeroController.text,
                      "Complemento": _complementoController.text == null ||
                              _complementoController.text == ""
                          ? user.Complemento
                          : _complementoController.text,
                      "Cidade": _cidadeController.text == null ||
                              _cidadeController.text == ""
                          ? user.Cidade
                          : _cidadeController.text,
                      'Estado': _dropdownEstado,
                      'Peso': _pesoController.text == null ||
                              _pesoController.text == ""
                          ? user.Peso
                          : _pesoController.text,
                      'Altura': _alturaController.text == null ||
                              _alturaController.text == ""
                          ? user.Altura
                          : _alturaController.text,
                      'Celular Emergencia': _emergencyPhoneController.text
                                      .replaceAll("(", "")
                                      .replaceAll(")", "")
                                      .replaceAll("-", "")
                                      .replaceAll(" ", "") ==
                                  null ||
                              _emergencyPhoneController.text
                                      .replaceAll("(", "")
                                      .replaceAll(")", "")
                                      .replaceAll("-", "")
                                      .replaceAll(" ", "") ==
                                  ""
                          ? user.Celular_Emergencia
                          : _emergencyPhoneController.text
                              .replaceAll("(", "")
                              .replaceAll(")", "")
                              .replaceAll("-", "")
                              .replaceAll(" ", ""),
                      'Nome Emergencia':
                          _nomeEmergenciaController.text == null ||
                                  _nomeEmergenciaController.text == ""
                              ? user.Nome_Emergencia
                              : _nomeEmergenciaController.text,
                    });

                    await firestoreInstance
                        .collection("Usuarios")
                        .where("Celular",
                            isEqualTo: user.Celular.replaceAll("(", "")
                                .replaceAll(")", "")
                                .replaceAll("-", "")
                                .replaceAll(" ", ""))
                        .get()
                        .then((querySnapshot) {
                      user = new ScreenArguments(
                          querySnapshot.docs.first.data()["Altura"],
                          querySnapshot.docs.first.data()["Bairro"],
                          querySnapshot.docs.first.data()["CEP"],
                          querySnapshot.docs.first.data()["Celular"],
                          querySnapshot.docs.first.data()["Celular Emergencia"],
                          querySnapshot.docs.first.data()["Cidade"],
                          querySnapshot.docs.first.data()["Complemento"],
                          querySnapshot.docs.first.data()["Data de nascimento"],
                          querySnapshot.docs.first.data()["Estado"],
                          querySnapshot.docs.first.data()["Nome"],
                          querySnapshot.docs.first.data()["Nome Emergencia"],
                          querySnapshot.docs.first.data()["Numero"],
                          querySnapshot.docs.first.data()["Peso"],
                          querySnapshot.docs.first.data()["Rua"],
                          querySnapshot.docs.first.data()["Tipo"]);
                    }).catchError((error) => print(error));

                    // ignore: deprecated_member_use
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 1),
                        content: Row(
                          children: [
                            Icon(
                              Icons.thumb_up,
                              color: Colors.white,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                "Alteração realizada com sucesso!",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  textColor: Colors.white,
                  padding: EdgeInsets.all(0.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 70.0,
                    width: 400.0,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      "Concluir",
                      style: GoogleFonts.getFont(
                        "Montserrat",
                        fontSize: 22.0,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
