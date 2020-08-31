class SportTypes1 {
  final List<SportTypes> sporttypes;
  SportTypes1({this.sporttypes});

  factory SportTypes1.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['sporttypes'] as List;
    List<SportTypes> sporttypes = list.map((i) => SportTypes.fromJson(i)).toList();


    return SportTypes1(
      sporttypes: sporttypes,
    );

}
}

class SportTypes {
  final List<dynamic> groupsST;
  final String displayName;
  final String sTUUID;
  SportTypes({this.displayName,this.groupsST, this.sTUUID});

  factory SportTypes.fromJson(Map<String,dynamic> parsedJson){


  return SportTypes(
    groupsST: parsedJson['groups'],
    displayName: parsedJson['displayName'],
    sTUUID: parsedJson['uuid']
  );
  }
}