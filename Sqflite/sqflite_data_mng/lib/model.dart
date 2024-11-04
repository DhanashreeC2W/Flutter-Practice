class Player {
  final String playerName;
  final int jerNo;
  final int runs;
  final double avg;

  const Player(
      {required this.playerName,
      required this.jerNo,
      required this.avg,
      required this.runs});

  Map <String,dynamic>playersMap() {
    return {"playerName": playerName, "jerNo": jerNo, "runs": runs, "avg": avg};
  }
}
