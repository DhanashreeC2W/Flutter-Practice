class PlayerModel {
  String name;
  int jerNo;
  int avg;

  PlayerModel({required this.name, required this.jerNo, required this.avg});

  Map<String,dynamic> playerMap() {
    return {"name": name, "jerNo": jerNo, "avg": avg};
  }
}
