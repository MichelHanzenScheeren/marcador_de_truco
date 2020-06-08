import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/player_description.dart';
import 'package:marcadordetruco/widgets/image_container.dart';

class PlayersImagesRow extends StatelessWidget {
  final PlayerDescription p1Description;
  final PlayerDescription p2Description;
  final double space;
  final double imageSize;

  PlayersImagesRow({
    @required this.p1Description,
    @required this.p2Description,
    this.space: 0,
    this.imageSize: 100,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: space / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ImageContainer(
            width: imageSize,
            height: imageSize,
            image: p1Description.image,
            type: p1Description.imageType,
          ),
          ImageContainer(
            width: imageSize,
            height: imageSize,
            image: p2Description.image,
            type: p2Description.imageType,
          ),
        ],
      ),
    );
  }
}
