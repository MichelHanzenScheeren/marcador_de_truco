import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/models/player_description.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/statics/my_images.dart';

class PlayersPointsRow extends StatelessWidget {
  final Truco truco;
  final double space;
  final double screenHeigth;

  PlayersPointsRow({
    @required this.truco,
    this.space: 0,
    this.screenHeigth: 700,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      children: <Widget>[
        columnPlayerPoints(truco.player1, theme),
        columnPlayerPoints(truco.player2, theme),
      ],
    );
  }

  Widget columnPlayerPoints(Player player, ThemeData theme) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Observer(builder: (_) {
            return Text(
              "${player.points}",
              style: TextStyle(
                fontSize: screenHeigth * 0.11,
                color: theme.textSelectionColor,
              ),
            );
          }),
          SizedBox(height: space),
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              width: screenHeigth * 0.105,
              height: screenHeigth * 0.105,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    player.description.playerNumber == Players.p1
                        ? MyImages.incrementLeft
                        : MyImages.incrementRight,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Observer(builder: (_) {
                  return Text(
                    "${truco.currentValue}",
                    style: TextStyle(
                      color: theme.textSelectionHandleColor.withAlpha(240),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  );
                }),
              ),
            ),
            onTap: () => truco.doRound(player.description.playerNumber),
          ),
        ],
      ),
    );
  }
}
