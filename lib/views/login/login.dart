import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_tfg_eco/controller/user_controller.dart';
import 'package:flutter_app_tfg_eco/views/home/home.dart';
import 'package:flutter_app_tfg_eco/views/register/cadastro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_tfg_eco/Arguments/ScreenArguments.dart';
import 'package:masked_text/masked_text.dart';

// Classe que armazena o
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserController uc = UserController();
  TextEditingController _phoneController = TextEditingController();
  // ignore: deprecated_member_use
  final firestoreInstance = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: _height,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: _height,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Elderly',
                          style: TextStyle(
                            fontFamily: 'Cookie',
                            fontSize: 80.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Telefone',
                          style: TextStyle(
                            fontFamily: 'Cookie',
                            fontSize: 50.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: MaskedTextField(
                            keyboardType: TextInputType.phone,
                            maxLength: 15,
                            maskedTextFieldController: _phoneController,
                            escapeCharacter: 'x',
                            mask: '(xx) xxxxx-xxxx',
                            inputDecoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              labelStyle: GoogleFonts.getFont('Montserrat'),
                              filled: true,
                              alignLabelWithHint: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: RaisedButton(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            onPressed: () async {
                              // Checar numero no banco de dados
                              await firestoreInstance
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
                                          querySnapshot.docs.first
                                              .data()["Altura"],
                                          querySnapshot.docs.first
                                              .data()["Bairro"],
                                          querySnapshot.docs.first
                                              .data()["CEP"],
                                          querySnapshot.docs.first
                                              .data()["Celular"],
                                          querySnapshot.docs.first
                                              .data()["Celular Emergencia"],
                                          querySnapshot.docs.first
                                              .data()["Cidade"],
                                          querySnapshot.docs.first
                                              .data()["Complemento"],
                                          querySnapshot.docs.first
                                              .data()["Data de nascimento"],
                                          querySnapshot.docs.first
                                              .data()["Estado"],
                                          querySnapshot.docs.first
                                              .data()["Nome"],
                                          querySnapshot.docs.first
                                              .data()["Nome Emergencia"],
                                          querySnapshot.docs.first
                                              .data()["Numero"],
                                          querySnapshot.docs.first
                                              .data()["Peso"],
                                          querySnapshot.docs.first
                                              .data()["Rua"],
                                          querySnapshot.docs.first
                                              .data()["Tipo"]);
                                  uc.setUser(arguments);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home(uc.user)),
                                  );
                                } else
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CadastroPage()));
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
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: <Color>[
                                    Color.fromRGBO(49, 49, 49, 0.4),
                                    Colors.grey[800],
                                    Color.fromRGBO(49, 49, 49, 0.0),
                                  ],
                                ),
                              ),
                              child: Text(
                                'Entrar',
                                style: TextStyle(
                                  fontFamily: 'Cookie',
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
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
                              'Cadastre-se',
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
