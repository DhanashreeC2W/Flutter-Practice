class Model {
  String personName;
  int personAge;
  String personEducation;
  int? personId;
  Model(
      {this.personId,
      required this.personName,
      required this.personAge,
      required this.personEducation});

  Map<String, dynamic> pseronDetailsMap() {
    return {
      "perName": personName,
      "personAge": personAge,
      "perEducation": personEducation,
    };
  }
}
