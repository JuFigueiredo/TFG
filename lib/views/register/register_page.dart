import "dart:ui";

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import 'package:flutter/services.dart';
import "package:flutter/widgets.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:intl/intl.dart';
import 'package:masked_text/masked_text.dart';

import 'register_finished.dart';

/// Pagina de Cadastro
class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  String _dropdownEstado = 'Selecionar';
  String _dropdownSangue = 'Selecionar';
  DateTime selectedDate = DateTime.now();
  final format = DateFormat("yyyy-MM-dd");
  // ignore: deprecated_member_use
  final firestoreInstance = Firestore.instance;
  String id = "";

  //Itens do cadastro
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _complementoController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _nascimentoController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _emergencyPhoneController =
      TextEditingController();
  final TextEditingController _nomeEmergenciaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text(
          "Cadastro",
          style: TextStyle(
            fontFamily: "Cookie",
            fontSize: 50.0,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(127, 181, 190, 1),
      ),
      backgroundColor: Color.fromRGBO(250, 250, 250, 0.9),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  "Celular:",
                  style: GoogleFonts.getFont("Montserrat",
                      fontSize: 18.0, letterSpacing: 0.5),
                ),
              ),
              MaskedTextField(
                keyboardType: TextInputType.phone,
                maxLength: 15,
                maskedTextFieldController: _phoneController,
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
                maxLength: 200,
                keyboardType: TextInputType.name,
                controller: _nomeController,
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
                      onChanged: (newValue) {
                        setState(() {
                          _dropdownEstado = newValue;
                        });
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
                      ].map<DropdownMenuItem<String>>((value) {
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
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Data de Nascimento:",
                  style: GoogleFonts.getFont("Montserrat",
                      fontSize: 18.0, letterSpacing: 0.5),
                ),
              ),
              DateTimeField(
                format: format,
                controller: _nascimentoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                initialValue: selectedDate,
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: selectedDate,
                      lastDate: DateTime(2100));
                },

                // keyboardType: TextInputType.datetime,
                // mask: "xx/xx/xxxx",
                // maxLength: 10,
                // maskedTextFieldController: _nascimentoController,
                // inputDecoration: InputDecoration(
                //   counterText: "",
                //   border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                // ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Tipo Sanguíneo:",
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
                      value: _dropdownSangue,
                      onChanged: (newValue) {
                        setState(() {
                          _dropdownSangue = newValue;
                        });
                      },
                      items: <String>[
                        'Selecionar',
                        'A+',
                        'A-',
                        'B+',
                        'B-',
                        'AB+',
                        'AB-',
                        'O+',
                        'O-'
                      ].map<DropdownMenuItem<String>>((value) {
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
                            maxLength: 3,
                            controller: _pesoController,
                            decoration: InputDecoration(
                              counterText: "",
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
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                            controller: _alturaController,
                            decoration: InputDecoration(
                              counterText: "",
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
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: RaisedButton(
                  color: Color.fromRGBO(44, 187, 101, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    // Texto de finalização de cadastro
                    //Registra o matuto no BD
                    firestoreInstance
                        .collection("users")
                        .doc(_phoneController.text
                            .replaceAll("(", "")
                            .replaceAll(")", "")
                            .replaceAll("-", "")
                            .replaceAll(" ", ""))
                        .set({
                      "phoneNumber": _phoneController.text
                          .replaceAll("(", "")
                          .replaceAll(")", "")
                          .replaceAll("-", "")
                          .replaceAll(" ", ""),
                      "name": _nomeController.text,
                      "cep": _cepController.text,
                      "street": _ruaController.text,
                      "district": _bairroController.text,
                      'number': _numeroController.text,
                      "additionalAddress": _complementoController.text,
                      "city": _cidadeController.text,
                      'state': _dropdownEstado,
                      'birthDate': _nascimentoController.text,
                      'bloodType': _dropdownSangue,
                      'weigth': _pesoController.text,
                      'height': _alturaController.text,
                      'sosPhoneNumber': _emergencyPhoneController.text
                          .replaceAll("(", "")
                          .replaceAll(")", "")
                          .replaceAll("-", "")
                          .replaceAll(" ", ""),
                      'sosName': _nomeEmergenciaController.text
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CadastroConcluidoPage(_phoneController.text)));
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
