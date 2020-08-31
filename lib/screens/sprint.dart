import 'dart:async';

import 'package:LeichtathletikSportfest/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:LeichtathletikSportfest/app.dart';
import 'package:LeichtathletikSportfest/models/data.dart';

import 'dart:developer';

class Sprint extends StatefulWidget {
  @override
  _SprintState createState() => _SprintState();
}

class _SprintState extends State<Sprint> {
  List<TableRow> classList = [];

  @override
  void initState() {
    super.initState();
    getPersList();
  }


  Future getPersList() async {
    Data _data = Json().data;
    for (var i; i < _data.groups1.groups.length; i++) {
      print(_data.groups1.groups[i].displayNameG);
      if (_data.groups1.groups[i].displayNameG == SportfestHome().curClass) {
        for (var j; j < _data.groups1.groups[i].persons.length; j++) {
          List<TableRow> list2 = [
            TableRow(children: [
              Text(_data.groups1.groups[i].persons[j].displayName)
            ])
          ];
          setState(() {
            classList.addAll(list2);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Table(children: classList);
  }
}
