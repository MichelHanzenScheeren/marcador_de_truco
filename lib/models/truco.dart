import 'package:flutter/cupertino.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/models/player_description.dart';
import 'package:marcadordetruco/models/round.dart';
import 'package:mobx/mobx.dart';
part 'truco.g.dart';

class Truco = _TrucoBase with _$Truco;

abstract class _TrucoBase with Store {
  int trucoID;

  Player player1;
  Player player2;
  int maxPoints;
  DateTime startDate;
  DateTime finalDate;

  @observable
  int currentValue;

  ObservableList<Round> rounds = ObservableList<Round>();

  _TrucoBase({
    this.trucoID,
    @required this.player1,
    @required this.player2,
    this.maxPoints: 12,
  }) {
    startDate = DateTime.now();
    currentValue = 1;
  }

  _TrucoBase.fromMap(Map map, Player p1, Player p2) {
    player1 = p1;
    player2 = p2;
    trucoID = map["trucoID"];
    maxPoints = map["maxPoints"];
    startDate = DateTime.parse(map["startDate"]);
    finalDate = DateTime.parse(map["finalDate"]);
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "maxPoints": maxPoints,
      "startDate": startDate.toString(),
      "finalDate": finalDate.toString(),
    };
    if (trucoID != null) map["trucoID"] = trucoID;
    return map;
  }

  @action
  void setCurrentValue() {
    if (currentValue == 1)
      currentValue = 3;
    else if (currentValue == 12)
      currentValue = 1;
    else
      currentValue += 3;
  }

  @action
  restartCurrentValue() {
    if (currentValue != 1) currentValue = 1;
  }

  @action
  void saveRound(Players playerNumber) {
    rounds.add(Round(playerNumber: playerNumber, points: currentValue));
  }

  @action
  void undoRound() {
    if (rounds.length == 0) return;

    Round round = rounds.removeLast();
    if (round.playerNumber == player1.description.playerNumber)
      decrementPoint(player1, round.points);
    else
      decrementPoint(player2, round.points);
  }

  @computed
  String get getTrucoText {
    if (currentValue == 1)
      return "Truco!";
    else if (currentValue == 3)
      return "Seis!";
    else if (currentValue == 6)
      return "Nove!";
    else if (currentValue == 9)
      return "Doze!";
    else
      return "Cancelar";
  }

  @computed
  bool get finishedGame =>
      player1.points == maxPoints || player2.points == maxPoints;

  Player get getWinner => player1.points == maxPoints ? player1 : player2;

  void doRound(Players playerNumber) {
    incrementPoint(playerNumber);
    saveRound(playerNumber);
    restartCurrentValue();
  }

  void incrementPoint(Players playerNumber) {
    if (playerNumber == player1.description.playerNumber)
      increment(player1);
    else
      increment(player2);
  }

  void increment(Player player) {
    if (player.points + currentValue <= maxPoints)
      player.setPoints(player.points + currentValue);
    else
      player.setPoints(maxPoints);
  }

  void decrementPoint(Player player, int value) {
    player.setPoints(player.points - value);
  }

  void reset() {
    player1?.resetPoints();
    player2?.resetPoints();
  }

  void saveFinalDate() {
    finalDate = DateTime.now();
  }
}
