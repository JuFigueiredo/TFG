import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// Forces portrait-only mode application-wide
/// Use this Mixin on the main app widget i.e. app.dart
/// Flutter's 'App' has to extend Stateless widget.
///
/// Call `super.build(context)` in the main build() method
/// to enable portrait only mode
mixin PortraitModeMixin on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _landscapeModeOnly();
    return null;
  }
}

/// Forces portrait-only mode on a specific screen
/// Use this Mixin in the specific screen you want to
/// block to portrait only mode.
///
/// Call `super.build(context)` in the State's build() method
/// and `super.dispose();` in the State's dispose() method
mixin PortraitStatefulModeMixin<T extends StatefulWidget> on State<T> {
  Widget buildLandscape(BuildContext context) {
    _landscapeModeOnly();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return null;
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }
}

/// blocks rotation; sets orientation to: portrait
void _landscapeModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}
