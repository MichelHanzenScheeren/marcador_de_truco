import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/widgets/edit_image_player.dart';
import '../../widgets/image_container.dart';

class PlayersImages extends StatelessWidget {
  final Player player1;
  final Player player2;
  PlayersImages(this.player1, this.player2);

  void editImage(BuildContext context, Player player) {
    showModalBottomSheet(
      context: context,
      builder: (context) => EditImagePlayer(player),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Observer(builder: (_) {
            return ImageContainer(
              image: player1.image,
              type: player1.imageType,
              height: 130,
              width: 130,
            );
          }),
          onTap: () => editImage(context, player1),
        ),
        Text("X"),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Observer(builder: (_) {
            return ImageContainer(
              image: player2.image,
              type: player2.imageType,
              height: 130,
              width: 130,
            );
          }),
          onTap: () => editImage(context, player2),
        ),
      ],
    );
  }
}
