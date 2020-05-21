import 'package:flutter/material.dart';
import './widgets/game_rounds.dart';
import './widgets/game_score.dart';
import '../../../models/truco.dart';

class HistoryTab extends StatelessWidget {
  final Truco truco;
  HistoryTab(this.truco);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.grey[350],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: <Widget>[
            GameScore(truco),
            Divider(),
            Text("Rodadas:", style: TextStyle(fontSize: 30)),
            SizedBox(height: 5),
            GameRounds(truco),
          ],
        ),
      ),
    );
  }
}
