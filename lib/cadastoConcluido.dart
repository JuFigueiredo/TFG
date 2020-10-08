import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "dart:ui";
import "package:flutter/widgets.dart";
import 'package:flutter_app_tfg_eco/login.dart';
import "package:google_fonts/google_fonts.dart";

class CadastroConcluidoPage extends StatefulWidget {
  @override
  _CadastroConcluidoPageState createState() => _CadastroConcluidoPageState();
}

class _CadastroConcluidoPageState extends State<CadastroConcluidoPage> {
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                label: Text(
                  "Voltar para login",
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
