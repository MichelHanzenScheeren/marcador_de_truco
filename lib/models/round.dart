import 'package:flutter/cupertino.dart';
import 'package:marcadordetruco/models/player_description.dart';

class Round {
  int roundID;
  int trucoID;

  DateTime dateTime;
  Players playerNumber;
  int points;

  Round({@required this.playerNumber, @required this.points, this.dateTime}) {
    if (dateTime == null) {
      dateTime = DateTime.now();
    }
  }

  Round.fromMap(Map map) {
    roundID = map["roundID"];
    trucoID = map["trucoID"];
    dateTime = DateTime.parse(map["dateTime"]);
    playerNumber = Players.values.firstWhere(
      (element) => element.toString().split(".").last == map["playerNumber"],
    );
    points = map["points"];
  }

  Map toMap(int trucoID) {
    Map<String, dynamic> map = {
      "trucoID": trucoID,
      "dateTime": dateTime.toString(),
      "playerNumber": playerNumber.toString().split(".").last,
      "points": points,
    };
    if (roundID != null) map["roundID"] = roundID;
    return map;
  }
}
