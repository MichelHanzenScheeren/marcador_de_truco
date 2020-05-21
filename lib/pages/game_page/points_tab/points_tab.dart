import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/truco_button.dart';
import './widgets/player_widget.dart';
import './widgets/undo_round_button.dart';
import '../../../models/truco.dart';
import '../../../statics/project_images.dart';

class PointsTab extends StatelessWidget {
  final Truco truco;
  PointsTab(this.truco);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            PlayerWidget(
              player: truco.player1,
              incrementImage: MyImages.incrementLeft,
              truco: truco,
            ),
            PlayerWidget(
              player: truco.player2,
              incrementImage: MyImages.incrementRight,
              truco: truco,
            ),
          ],
        ),
        TrucoButton(truco: truco),
        UndoRoundButton(undoFunction: truco.undoRound),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("0", style: TextStyle(fontSize: 20)),
              Text("Vitórias", style: TextStyle(fontSize: 20)),
              Text("0", style: TextStyle(fontSize: 20)),
            ],
          ),
        )
      ],
    );
  }
}
