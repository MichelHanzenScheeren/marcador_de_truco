import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/game_model.dart';
import './widgets/game_rounds.dart';
import './widgets/game_score.dart';

class HistoryTab extends StatelessWidget {
  final GameModel gameModel;
  HistoryTab(this.gameModel);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: gameModel.games.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildTrucoGame(context, index),
            Divider(),
          ],
        );
      },
    );
  }

  Widget buildTrucoGame(BuildContext context, int index) {
    return Card(
      borderOnForeground: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.grey[350],
      elevation: 0,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          accentColor: Colors.black,
        ),
        child: ExpansionTile(
          initiallyExpanded: true,
          title: GameScore(gameModel.games[index]),
          children: <Widget>[
            GameRounds(gameModel.games[index]),
          ],
        ),
      ),
    );
  }
}
