import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_app_tfg_eco/Home/home.dart';
import 'package:flutter_app_tfg_eco/cadastro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:masked_text/masked_text.dart';

// Classe que armazena o
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController();
  // ignore: deprecated_member_use
  final firestoreInstance = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
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
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            padding:
                                EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 70.0),
                            child: Text(
                              "Veio's Fall",
                              style: TextStyle(
                                fontFamily: 'Cookie',
                                fontSize: 80.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding:
                                EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                            child: Text(
                              "Telefone",
                              style: TextStyle(
                                fontFamily: 'Cookie',
                                fontSize: 50.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
                            child: MaskedTextField(
                              keyboardType: TextInputType.phone,
                              maxLength: 15,
                              maskedTextFieldController: _phoneController,
                              escapeCharacter: 'x',
                              mask: "(xx) xxxxx-xxxx",
                              inputDecoration: InputDecoration(
                                counterText: "",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                labelStyle: GoogleFonts.getFont('Montserrat'),
                                filled: true,
                                alignLabelWithHint: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                              height: 70.0,
                              width: 400.0,
                              padding: EdgeInsets.fromLTRB(10, 10.0, 10, 0),
                              child: RaisedButton(
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  onPressed: () {
                                    // Checar numero no banco de dados
                                    firestoreInstance
                                        .collection("Usuarios")
                                        .where("Celular",
                                            isEqualTo: _phoneController.text
                                                .replaceAll("(", "")
                                                .replaceAll(")", "")
                                                .replaceAll("-", "")
                                                .replaceAll(" ", ""))
                                        .get()
                                        .then((querySnapshot) {
                                      if (querySnapshot.size > 0) {
                                        ScreenArguments arguments =
                                            new ScreenArguments(
                                                querySnapshot.docs.first.data()[
                                                    "Altura"],
                                                querySnapshot.docs.first.data()[
                                                    "Message"],
                                                querySnapshot.docs.first.data()[
                                                    "CEP"],
                                                querySnapshot.docs.first.data()[
                                                    "Celular"],
                                                querySnapshot.docs.first.data()[
                                                    "Celular Emergencia"],
                                                querySnapshot.docs.first.data()[
                                                    "Cidade"],
                                                querySnapshot.docs.first.data()[
                                                    "Complemento"],
                                                querySnapshot.docs.first.data()[
                                                    "Data de nascimento"],
                                                querySnapshot.docs.first.data()[
                                                    "Estado"],
                                                querySnapshot.docs.first.data()[
                                                    "Nome"],
                                                querySnapshot.docs.first.data()[
                                                    "Nome Emergencia"],
                                                querySnapshot.docs.first.data()[
                                                    "Numero"],
                                                querySnapshot
                                                    .docs.first
                                                    .data()["Peso"],
                                                querySnapshot.docs.first
                                                    .data()["Rua;"],
                                                querySnapshot.docs.first
                                                    .data()["Tipo"]);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Home(arguments)),
                                        );
                                      } else
                                        print("Usuário não existe");
                                    }).catchError((error) => print(error));
                                  },
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(0.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 70.0,
                                    width: 400.0,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          Color.fromRGBO(49, 49, 49, 0.4),
                                          Color.fromRGBO(149, 149, 149, 0.6),
                                          Color.fromRGBO(49, 49, 49, 0.0),
                                        ],
                                      ),
                                    ),
                                    child: Text(
                                      "Entrar",
                                      style: TextStyle(
                                        fontFamily: 'Cookie',
                                        fontSize: 45.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))),
                          Container(
                            child: FlatButton(
                              padding:
                                  EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                              onPressed: () {
                                //Código de se cadastrar
                                // Direcionar para a página de cadastro
                                _phoneController.text = "";

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CadastroPage()),
                                );
                              },
                              textColor: Colors.black,
                              child: Text(
                                "Cadastre-se",
                                style: TextStyle(
                                  fontFamily: 'Cookie',
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
