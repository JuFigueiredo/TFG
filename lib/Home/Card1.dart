import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Card1 extends StatefulWidget {
  @override
  _Card1State createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      height: 240,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: Color.fromRGBO(250, 250, 250, 0.8),
        elevation: 5,
        borderOnForeground: true,
        shadowColor: Colors.black,
        child: Column(
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          verticalDirection: VerticalDirection.down,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              textBaseline: TextBaseline.alphabetic,
              verticalDirection: VerticalDirection.down,
              children: [
                Icon(Icons.person),
                Flexible(
                  child: Text(
                    "user.Nome",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      shadows: [Shadow(color: Colors.black, blurRadius: 0.7)],
                      fontFamily: 'Montserrat',
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    // (DateTime.now()
                    //                 .difference(DateTime
                    //                     .parse(user
                    //                         .Data_de_nascimento))
                    //                 .inDays ~/
                    //             365)
                    //         .toString() +
                    ' anos',
                    style: TextStyle(
                      shadows: [Shadow(color: Colors.black, blurRadius: 0.7)],
                      fontFamily: 'Montserrat',
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black26,
              thickness: 1.2,
            ),
            Row(
              children: [
                Icon(FlutterIcons.water_mco),
                Text(
                  "",
                  // "Tipo sanguíneo : ${user.Tipo}",
                  style: TextStyle(
                    shadows: [Shadow(color: Colors.black, blurRadius: 0.7)],
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(FlutterIcons.weight_mco),
                Text(
                  "",
                  // "Peso: ${user.Peso}kg",
                  style: TextStyle(
                    shadows: [Shadow(color: Colors.black, blurRadius: 0.7)],
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Icon(FlutterIcons.ruler_ent),
                Text(
                  "",
                  // "Altura: ${user.Altura} cm", //"user.Nome",
                  style: TextStyle(
                    shadows: [Shadow(color: Colors.black, blurRadius: 0.7)],
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
