import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GraphTab extends StatefulWidget {
  @override
  _GraphTabState createState() => _GraphTabState();
}

class _GraphTabState extends State<GraphTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Icon(Icons.access_time),
    );
  }
}
