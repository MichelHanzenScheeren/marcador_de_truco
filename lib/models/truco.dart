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

  void incrementPoint(int player) {
    if (player == 1)
      player1.incrementPoints();
    else
      player2.incrementPoints();
  }
}
