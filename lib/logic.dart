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

  List<Widget> getClassList(Data data) {
    List<Widget> list1 = [];
    for (int i = 0; i < data.groups1.groups.length; i++)
    {
      String className = data.groups1.groups[i].displayNameG;
      List<Widget> list2 = [CupertinoButton(child: Text(className), onPressed: () {
                    log(className);
                    SportfestHome().curClass = className;
                  },color: Colors.grey[400],
                )];
      list1.addAll(list2);
    }
    return list1;
  }

}

class Json {
  Data data;

  Future loadJson() async {
    var content = await Logic().fileToString();
    final _buff = jsonDecode(content);
    data = Data.fromJson(_buff);
    log("hhhhhhhhhhhh");
  }
}