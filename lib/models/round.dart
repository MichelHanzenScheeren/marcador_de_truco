import 'package:flutter/cupertino.dart';
import './player.dart';

class Round {
  DateTime dateTime;
  Players playerNumber;
  int points;

  Round({@required this.playerNumber, @required this.points, this.dateTime}) {
    if (dateTime == null) {
      dateTime = DateTime.now();
    }
  }
}
