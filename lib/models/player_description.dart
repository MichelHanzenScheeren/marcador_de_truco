import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:marcadordetruco/statics/my_images.dart';
import 'package:mobx/mobx.dart';
part 'player_description.g.dart';

enum Players { p1, p2 }
enum ImageType { asset, file }

class PlayerDescription = _PlayerDescriptionBase with _$PlayerDescription;

abstract class _PlayerDescriptionBase with Store {
  @observable
  String image;

  @observable
  ImageType imageType;

  @observable
  String name;

  Players playerNumber;

  _PlayerDescriptionBase({
    @required this.name,
    this.image: "",
    this.imageType,
    @required this.playerNumber,
  }) {
    if (image.isEmpty) setImage(getRandomImage(), ImageType.asset);
  }

  _PlayerDescriptionBase.fromMap(Map map) {
    image = map["image"];
    imageType = ImageType.values.firstWhere(
      (e) => e.toString().split(".").last == map["imageType"],
    );
    name = map["name"];
    playerNumber = Players.values.firstWhere(
      (e) => e.toString().split(".").last == map["playerNumber"],
    );
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
}
