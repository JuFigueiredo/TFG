import 'package:flutter/material.dart';

/// Pagina inicial para que termina a inicialização do firebase
class LoadingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(127, 181, 190, 1),
        body: Center(
          child: Text(
            'Elderly',
            style: TextStyle(
              fontFamily: 'Cookie',
              fontSize: 80.0,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ));
  }
}
