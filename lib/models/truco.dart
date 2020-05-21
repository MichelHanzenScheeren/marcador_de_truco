import 'package:flutter/cupertino.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/models/round.dart';
import 'package:mobx/mobx.dart';
part 'truco.g.dart';

class Truco = _TrucoBase with _$Truco;

abstract class _TrucoBase with Store {
  Player player1;
  Player player2;
  DateTime startDate;
  DateTime finalDate;

  @observable
  int currentValue = 1;

  ObservableList<Round> rounds = ObservableList<Round>();

  _TrucoBase({@required this.player1, @required this.player2}) {
    startDate = DateTime.now();
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

  void doRound(Players playerNumber) {
    incrementPoint(playerNumber);
    saveRound(playerNumber);
    restartCurrentValue();
  }

  void incrementPoint(Players playerNumber) {
    if (playerNumber == player1.playerNumber)
      increment(player1);
    else
      increment(player2);
  }

  void increment(Player player) {
    if (player.points + currentValue <= 12)
      player.setPoints(player.points + currentValue);
    else
      player.setPoints(12);
  }
}
