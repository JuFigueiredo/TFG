import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "dart:ui";
import "package:flutter/widgets.dart";
import 'package:flutter_app_tfg_eco/Arguments/ScreenArguments.dart';
import 'package:flutter_app_tfg_eco/controller/user_controller.dart';
import 'package:flutter_app_tfg_eco/views/home/home.dart';
import "package:google_fonts/google_fonts.dart";

// ignore: must_be_immutable
class CadastroConcluidoPage extends StatefulWidget {
  String phone;

  CadastroConcluidoPage(String phone) {
    this.phone = phone;
  }
  @override
  _CadastroConcluidoPageState createState() =>
      _CadastroConcluidoPageState(this.phone);
}

class _CadastroConcluidoPageState extends State<CadastroConcluidoPage> {
  String phone;
  UserController uc = UserController();
  _CadastroConcluidoPageState(String phone) {
    this.phone = phone;
  }

  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
            height: 400,
            width: 400,
            child: Card(
              color: Color.fromRGBO(238, 238, 238, 1),
              shadowColor: Colors.black,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Icon(
                        Icons.brightness_1,
                        size: 170,
                        color: Color.fromRGBO(44, 187, 101, 1),
                      ),
                      Icon(
                        Icons.check,
                        size: 200,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                    child: Text(
                      "Cadastro concluído!",
                      style: TextStyle(
                        fontFamily: 'Cookie',
                        fontSize: 50.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: SizedBox(
              height: 60.0,
              width: 380.0,
              child: RaisedButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Color.fromRGBO(44, 187, 101, 1),
                onPressed: () async {
                  await firestoreInstance
                      .collection("Usuarios")
                      .where("Celular",
                          isEqualTo: phone
                              .replaceAll("(", "")
                              .replaceAll(")", "")
                              .replaceAll("-", "")
                              .replaceAll(" ", ""))
                      .get()
                      .then((querySnapshot) {
                    if (querySnapshot.size > 0) {
                      ScreenArguments arguments = new ScreenArguments(
                          querySnapshot.docs.first.data()["Altura"],
                          querySnapshot.docs.first.data()["Message"],
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
                          querySnapshot.docs.first.data()["Rua;"],
                          querySnapshot.docs.first.data()["Tipo"]);
                      uc.setUser(arguments);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home(uc.user)),
                      );
                    }
                  }).catchError((error) => print(error));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                label: Text(
                  "Entrar",
                  style: GoogleFonts.getFont(
                    "Montserrat",
                    fontSize: 22.0,
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
                elevation: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
