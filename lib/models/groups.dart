class Groups1 {
  final List<Groups> groups;
  Groups1({this.groups});

  factory Groups1.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['groups'] as List;
    List<Groups> groups = list.map((i) => Groups.fromJson(i)).toList();


    return Groups1(
      groups: groups,
    );

}

}

class Groups {
  final List<Persons> persons;
  final String displayNameG;
  final String gUUID;

  Groups({this.displayNameG, this.gUUID, this.persons});

  factory Groups.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['persons'] as List;
    List<Persons> persons = list.map((i) => Persons.fromJson(i)).toList();


    return Groups(
      persons: persons,
      displayNameG: parsedJson['displayName'],
      gUUID: parsedJson['uuid']
    );
}
}

class Persons {
  final String gender;
  final String displayName;
  final String pUUID;

  Persons({this.displayName,this.gender,this.pUUID});

  factory Persons.fromJson(Map<String, dynamic> parsedJson){

    return Persons(
      gender: parsedJson['gender'],
      displayName: parsedJson['displayName'],
      pUUID: parsedJson['uuid']
    );
}
}