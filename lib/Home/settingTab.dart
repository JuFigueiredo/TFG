import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingTab extends StatefulWidget {
  @override
  _SettingTabState createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Icon(Icons.accessible_rounded),
    );
  }
}
