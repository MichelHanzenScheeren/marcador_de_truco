import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'dart:math';
import '../statics/project_images.dart';
part 'player.g.dart';

class Player = _PlayerBase with _$Player;
enum Players { p1, p2 }
enum ImageType { asset, file }

abstract class _PlayerBase with Store {
  @observable
  String image;

  @observable
  ImageType imageType;

  @observable
  String name;

  @observable
  int points;

  Players playerNumber; //enumeração

  _PlayerBase(
      {@required this.name,
      this.image: "",
      this.imageType,
      this.points: 0,
      @required this.playerNumber}) {
    if (image.isEmpty) {
      setImage(getRandomImage(), ImageType.asset);
    }
  }

  String getRandomImage() {
    return <String>[MyImages.player1, MyImages.player2]
        .elementAt(Random().nextInt(2));
  }

  @action
  void setName(String text) => name = text;

  @action
  void setImage(String text, ImageType type) {
    image = text;
    imageType = type;
  }

  @action
  void setPoints(int value) => points = value;

  @action
  void resetPoints() => points = 0;
}
