import 'package:flutter/cupertino.dart';
import 'package:marcadordetruco/models/player_description.dart';
import 'package:mobx/mobx.dart';
part 'player.g.dart';

class Player = _PlayerBase with _$Player;

abstract class _PlayerBase with Store {
  int id;
  int trucoId;

  PlayerDescription description;

  @observable
  int points;

  _PlayerBase({@required this.description, this.points: 0});

  @action
  void setPoints(int value) => points = value;

  @action
  void resetPoints() => points = 0;
}
