import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter/services.dart';

class Sportfest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return CupertinoApp(
      home: SportfestHome(),
    );
  }
}
class SportfestHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: Text("1"),
      );
    }
  }