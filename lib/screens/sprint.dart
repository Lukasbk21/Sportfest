import 'dart:async';

import 'package:LeichtathletikSportfest/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:LeichtathletikSportfest/app.dart';
import 'package:LeichtathletikSportfest/models/data.dart';

import 'dart:developer';

  Widget sprint(BuildContext context,List<TableRow> persListRun){
    return Table(children: persListRun);
  }
