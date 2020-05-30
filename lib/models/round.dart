import 'package:flutter/cupertino.dart';
import 'package:marcadordetruco/models/player_description.dart';

class Round {
  int id;
  int trucoId;

  DateTime dateTime;
  Players playerNumber;
  int points;

  Round({@required this.playerNumber, @required this.points, this.dateTime}) {
    if (dateTime == null) {
      dateTime = DateTime.now();
    }
  }
}
