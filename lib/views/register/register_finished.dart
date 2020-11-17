import "dart:ui";

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
import "package:google_fonts/google_fonts.dart";

import '../../controller/user_controller.dart';
import '../../models/user_model.dart';
import '../home/home_page.dart';

/// Tela que mostra que o cadastro foi concluído
/// ignore: must_be_immutable
class CadastroConcluidoPage extends StatefulWidget {
  /// ID do banco
  String phone;

  /// Construtor
  CadastroConcluidoPage(String phone) {
    phone = phone;
  }
  @override
  _CadastroConcluidoPageState createState() =>
      _CadastroConcluidoPageState(phone);
}

class _CadastroConcluidoPageState extends State<CadastroConcluidoPage> {
  String phone;
  UserController uc = UserController();
  _CadastroConcluidoPageState(String phone) {
    phone = phone;
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
                      .collection("users")
                      .where("phoneNumber",
                          isEqualTo: phone
                              .replaceAll("(", "")
                              .replaceAll(")", "")
                              .replaceAll("-", "")
                              .replaceAll(" ", ""))
                      .get()
                      .then((querySnapshot) {
                    if (querySnapshot.size > 0) {
                      var arguments = UserModel(
                          querySnapshot.docs.first.data()["height"],
                          querySnapshot.docs.first.data()["district"],
                          querySnapshot.docs.first.data()["postalCode"],
                          querySnapshot.docs.first.data()["phoneNumber"],
                          querySnapshot.docs.first.data()["sosPhoneNumber"],
                          querySnapshot.docs.first.data()["city"],
                          querySnapshot.docs.first.data()["additionalAddress"],
                          querySnapshot.docs.first.data()["birthDate"],
                          querySnapshot.docs.first.data()["state"],
                          querySnapshot.docs.first.data()["name"],
                          querySnapshot.docs.first.data()["sosName"],
                          querySnapshot.docs.first.data()["number"],
                          querySnapshot.docs.first.data()["weigth"],
                          querySnapshot.docs.first.data()["street;"],
                          querySnapshot.docs.first.data()["bloodType"]);
                      uc.setUser(arguments);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home(uc.user)),
                      );
                    }
                  }).catchError(print);
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
