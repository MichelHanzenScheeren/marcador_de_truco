import 'package:flutter/cupertino.dart';
import 'package:marcadordetruco/models/player_description.dart';
import 'package:mobx/mobx.dart';
part 'player.g.dart';

class Player = _PlayerBase with _$Player;

abstract class _PlayerBase with Store {
  int playerID;
  int trucoID;

  PlayerDescription description;

  @observable
  int points;

  _PlayerBase({@required this.description, this.points: 0});

  _PlayerBase.fromMap(Map map) {
    playerID = map["playerID"];
    trucoID = map["trucoID"];
    points = map["points"];
    description = PlayerDescription.fromMap(map);
  }

  Map toMap(int trucoID) {
    Map<String, dynamic> map = {
      "trucoID": trucoID,
      "points": points,
      "image": description.image,
      "imageType": toValueString(description.imageType),
      "name": description.name,
      "playerNumber": toValueString(description.playerNumber),
    };
    if (playerID != null) map["playerID"] = playerID;
    return map;
  }

  String toValueString(dynamic value) {
    return value.toString().split(".").last;
  }

  @action
  void setPoints(int value) => points = value;

  @action
  void resetPoints() => points = 0;
}
