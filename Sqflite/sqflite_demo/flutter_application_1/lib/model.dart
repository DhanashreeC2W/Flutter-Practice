class Model {
  String perName;
  int perAge;
  String perEducation;
  int? personId;
  Model(
      {this.personId,
      required this.perName,
      required this.perAge,
      required this.perEducation});

  Map<String, dynamic> pseronDetailsMap() {
    return {
      "perName": perName,
      "perAge": perAge,
      "perEducation": perEducation,
    };
  }
}
