import 'package:LeichtathletikSportfest/models/sporttypes.dart';
import 'package:LeichtathletikSportfest/models/groups.dart';
import 'package:LeichtathletikSportfest/models/values.dart';


class Data {

  final SportTypes1 sporttypes1;
  final Groups1 groups1;
  final Values1 values1;

  Data({this.sporttypes1, this.groups1, this.values1});

  factory Data.fromJson(Map<String,dynamic> parsedJson){
  return Data(
    values1: Values1.fromJson(parsedJson['values']),
    groups1: Groups1.fromJson(parsedJson['groups']),
    sporttypes1: SportTypes1.fromJson(parsedJson['sportTypes']),
    
  );
  }
}