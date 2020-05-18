import 'package:flutter/material.dart';
import './widgets/game_rounds.dart';
import './widgets/game_score.dart';

class HistoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          color: Colors.grey[350],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                GameScore(),
                Divider(),
                GameRounds(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
