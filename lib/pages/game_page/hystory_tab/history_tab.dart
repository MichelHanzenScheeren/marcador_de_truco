import 'package:flutter/material.dart';
import './widgets/game_rounds.dart';
import './widgets/game_score.dart';
import '../../../models/truco.dart';

class HistoryTab extends StatelessWidget {
  final Truco truco;
  HistoryTab(this.truco);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Card(
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
              title: GameScore(truco),
              children: <Widget>[
                GameRounds(truco),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
