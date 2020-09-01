import 'dart:async';
import 'dart:developer';

import 'package:LeichtathletikSportfest/models/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'dart:io';

import 'package:LeichtathletikSportfest/app.dart';

class Logic {
  Future<String> fileToString() async {
    return await rootBundle.loadString("assets/data.json");
  }

  void writeToFile (String val, String uuid , String sT){
    
  }

  List<Widget> getClassList(Data data) {
    List<Widget> list1 = [];
    try {
      for (int i = 0; i < data.groups1.groups.length; i++) {
        String className = data.groups1.groups[i].displayNameG;
        List<Widget> list2 = [
          CupertinoButton(
            child: Text(className),
            onPressed: () {
              log(className);
              SportfestHome().curClass = className;
            },
            color: Colors.grey[400],
          )
        ];
        list1.addAll(list2);
      }
      return list1;
    } catch (e) {
      log("1");
    }
  }

  List<TableRow> getPersListRun(Data data) {
    List<TableRow> list1 = [];
    print(data.groups1.groups[0].persons.length);
    try {
      for (var i = 0; i < data.groups1.groups.length; i++) {
        log(SportfestHome().curClass);
        if (data.groups1.groups[i].displayNameG == SportfestHome().curClass) {
          for (var j = 0; j < data.groups1.groups[i].persons.length; j++) {
            List<TableRow> list2 = [
              TableRow(children: [
                Text(data.groups1.groups[i].persons[j].displayName),
                CupertinoTextField(placeholder: "erster Versuch",
                onSubmitted: (String value) {print(value);
                writeToFile(value,data.groups1.groups[i].persons[j].pUUID,data.sporttypes1.sporttypes[0].sTUUID);},
                keyboardType: TextInputType.number,
                ),
              ])
            ];
            list1.addAll(list2);
          }
          return list1;
        }
      }
      return [
        TableRow(children: [Text("----")])
      ];
    } catch (e) {
      log("!");
      return [
        TableRow(children: [Text("----")])
      ];
    }
  }
}
