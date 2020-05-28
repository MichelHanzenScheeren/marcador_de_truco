import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../models/player.dart';
import '../../../../../widgets/edit_image_player.dart';
import '../../../../../widgets/image_container.dart';

class PlayersImages extends StatelessWidget {
  final Player player1;
  final Player player2;
  final double imageSize;
  PlayersImages({
    @required this.player1,
    @required this.player2,
    @required this.imageSize,
  });

  void editImage(BuildContext context, Player player) {
    showModalBottomSheet(
      context: context,
      builder: (context) => EditImagePlayer(player),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).accentColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Observer(builder: (_) {
            return ImageContainer(
              image: player1.image,
              type: player1.imageType,
              height: imageSize,
              width: imageSize,
              borderColor: primaryColor,
            );
          }),
          onTap: () => editImage(context, player1),
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Observer(builder: (_) {
            return ImageContainer(
              image: player2.image,
              type: player2.imageType,
              height: imageSize,
              width: imageSize,
              borderColor: primaryColor,
            );
          }),
          onTap: () => editImage(context, player2),
        ),
      ],
    );
  }
}
