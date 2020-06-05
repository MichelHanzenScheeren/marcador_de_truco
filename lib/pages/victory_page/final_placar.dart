import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/widgets/game_score.dart';

class FinalPlacar extends StatelessWidget {
  final Truco currentGame;
  FinalPlacar(this.currentGame);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          "Placar Final:",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: theme.textSelectionColor,
          ),
        ),
        GameScore(currentGame),
      ],
    );
  }
}
