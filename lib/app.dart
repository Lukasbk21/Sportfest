import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';

import 'package:LeichtathletikSportfest/logic.dart';

import 'package:LeichtathletikSportfest/screens/sprung.dart';
import 'package:LeichtathletikSportfest/screens/sprint.dart';
import 'package:LeichtathletikSportfest/screens/wurf.dart';

import 'package:LeichtathletikSportfest/models/data.dart';

import 'dart:developer';

class Sportfest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    return CupertinoApp(
      home: SportfestStateful(),
    );
  }
}

class SportfestStateful extends StatefulWidget {
  @override
  SportfestHome createState() => SportfestHome();
}

class SportfestHome extends State<SportfestStateful> {
  int _selectedTabIndex = 0;
  List<Widget> classList = [Text("----")];
  List<TableRow> persListRun = [TableRow(children: [Text("----")])];
  String curClass = "5A";

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Data data;

  Future loadJson() async {
    var content = await Logic().fileToString();
    final _buff = jsonDecode(content);
    setState(() {
      data = Data.fromJson(_buff);
      classList = Logic().getClassList(data);
      persListRun = Logic().getPersListRun(data);
      print(persListRun);
    });
  }

//tabs / screens:
  List<Widget> _tabs = <Widget>[
    Sprung(),
    //sprint(persListRun),
    Wurf(),
  ]; //sprung == 0 ; sprint == 1 ; Wurf == 2

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          trailing: CupertinoContextMenu(
            child: Text("Sportart wechseln"),
            actions: [
              CupertinoButton(
                color: Colors.grey[400],
                child: Text("Weitsprung"),
                onPressed: () {
                  setState(() {
                    log("Weitsprung");
                    _selectedTabIndex = 0;
                  });
                },
              ),
              CupertinoButton(
                color: Colors.grey[400],
                child: Text("50m/100m Sprint"),
                onPressed: () {
                  loadJson();
                  setState(() {
                    log("Sprint");
                    _selectedTabIndex = 1;
                  });
                },
              ),
              CupertinoButton(
                color: Colors.grey[400],
                child: Text("Wurf/Kugelstoßen"),
                onPressed: () {
                  setState(() {
                    log("Wurf");
                    _selectedTabIndex = 2;
                  });
                },
              ),
            ],
          ),
          leading: CupertinoContextMenu(
            child: Text(
              "Klasse wechseln",
            ),
            actions: classList,
          ),
        ),
        child: Center(
          child: [
    Sprung(),
    sprint(context, persListRun),//persListRun
    Wurf(),].elementAt(_selectedTabIndex),
        ));
  }
}
