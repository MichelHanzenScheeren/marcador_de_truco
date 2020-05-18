import 'package:flutter/cupertino.dart';
import 'package:marcadordetruco/models/player.dart';
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

  void incrementPoint(int player) {
    if (player == 1)
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
