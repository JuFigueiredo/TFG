import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tfg_eco/Arguments/ScreenArguments.dart';
import 'package:flutter_app_tfg_eco/Home/alterar.dart';

import 'homeTab.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  ScreenArguments arguments;
  List<charts.Series> l = [];

  Home(ScreenArguments arguments) {
    this.arguments = arguments;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(127, 181, 190, 1),
            bottom: TabBar(
              labelColor: Color.fromRGBO(250, 250, 250, 1),
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.home,
                  size: 30.0,
                  color: Colors.white,
                )),
                Tab(
                    icon: Icon(
                  Icons.insert_chart_outlined,
                  size: 30.0,
                  color: Colors.white,
                )),
                Tab(
                    icon: Icon(
                  Icons.settings,
                  size: 30.0,
                  color: Colors.white,
                )),
              ],
            ),
            title: Text(
              "Veio's Fall",
              style: TextStyle(
                  fontFamily: "Cookie",
                  fontSize: 45.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  shadows: [
                    Shadow(color: Colors.white, blurRadius: 5.0),
                  ]),
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              HomeTab(arguments),
              Text("oi"), //GraphHome(l),
              AlterarPage(arguments),
            ],
          ),
        ),
      ),
    );
  }
}
