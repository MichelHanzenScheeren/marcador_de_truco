import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/models/player_description.dart';
import '../../../../../widgets/edit_image_player.dart';
import '../../../../../widgets/image_container.dart';

class PlayersImages extends StatelessWidget {
  final PlayerDescription p1Description;
  final PlayerDescription p2Description;
  final double imageSize;
  PlayersImages({
    @required this.p1Description,
    @required this.p2Description,
    @required this.imageSize,
  });

  void editImage(BuildContext context, PlayerDescription playerDescription) {
    showModalBottomSheet(
      context: context,
      builder: (context) => EditImagePlayer(playerDescription),
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
              image: p1Description.image,
              type: p1Description.imageType,
              height: imageSize,
              width: imageSize,
              borderColor: primaryColor,
            );
          }),
          onTap: () => editImage(context, p1Description),
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Observer(builder: (_) {
            return ImageContainer(
              image: p2Description.image,
              type: p2Description.imageType,
              height: imageSize,
              width: imageSize,
              borderColor: primaryColor,
            );
          }),
          onTap: () => editImage(context, p2Description),
        ),
      ],
    );
  }
}
