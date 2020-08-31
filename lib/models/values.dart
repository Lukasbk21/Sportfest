import 'dart:ffi';

class Values1 {
  final List<Values> values;

  Values1({this.values});

  factory Values1.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['values'] as List;
    List<Values> values = list.map((i) => Values.fromJson(i)).toList();


    return Values1(
      values: values,
    );

}
}

class Values {
  final String sport;
  final String pers;
  final List<dynamic> val;

  Values({this.pers,this.sport,this.val});

  factory Values.fromJson(Map<String, dynamic> parsedJson){

    return Values(
      sport: parsedJson['sporttype'],
      pers: parsedJson['person'],
      val: parsedJson['values']
    );
}
}