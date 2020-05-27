import 'package:flutter/material.dart';
import './widgets/game_rounds.dart';
import './widgets/game_score.dart';
import '../../../controllers/game_controller.dart';

class HistoryTab extends StatelessWidget {
  final GameController gameModel;
  HistoryTab(this.gameModel);

  final TextStyle titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: controller,
        itemCount: gameModel.games.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              children: <Widget>[
                SizedBox(height: 15),
                Text("Partida atual:", style: titleStyle),
                buildTrucoCard(context, index, true),
              ],
            );
          } else if (index == 1) {
            return Column(
              children: <Widget>[
                Divider(),
                gameModel.games.length == 2
                    ? Text("Partida anterior:", style: titleStyle)
                    : Text("Partidas anteriores:", style: titleStyle),
                buildTrucoCard(context, index, false),
                SizedBox(height: 10),
              ],
            );
          } else if (index == gameModel.games.length - 1) {
            return Column(
              children: <Widget>[
                buildTrucoCard(context, index, false),
                SizedBox(height: 10),
              ],
            );
          } else {
            return buildTrucoCard(context, index, false);
          }
        });
  }

  Widget buildTrucoCard(BuildContext context, int index, bool startExpanded) {
    return Card(
      borderOnForeground: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Colors.grey[350],
      elevation: 0,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          accentColor: Colors.black,
        ),
        child: ExpansionTile(
          initiallyExpanded: startExpanded,
          title: GameScore(gameModel.games[index]),
          children: <Widget>[
            GameRounds(
              gameModel.games[index],
              controller,
            ),
          ],
        ),
      ),
    );
  }
}
