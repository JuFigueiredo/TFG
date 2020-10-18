import 'package:flutter/material.dart';

class LoadingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(127, 181, 190, 1),
        body: Center(
          child: Text(
            "Veio's Fall",
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
