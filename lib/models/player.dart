import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'dart:math';
import '../statics/project_images.dart';
part 'player.g.dart';

class Player = _PlayerBase with _$Player;

abstract class _PlayerBase with Store {
  @observable
  String image;

  @observable
  String name;

  @observable
  int points;

  _PlayerBase({@required this.name, this.image: "", this.points: 0}) {
    if (image.isEmpty) {
      image = <String>[MyImages.player1, MyImages.player2]
          .elementAt(Random().nextInt(1));
    }
  }

  @action
  void setName(String text) => name = text;

  @action
  void setImage(String text) => image = text;

  @action
  void incrementPoints() => points++;

  @action
  void decrementPoints() => points--;

  @action
  void resetPoints() => points = 0;
}
