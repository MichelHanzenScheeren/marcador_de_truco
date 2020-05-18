import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/player.dart';
import './widgets/truco_button.dart';
import './widgets/undo_round_button.dart';
import '../../../statics/project_images.dart';

class PointsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Player(
              playerName: "Nós",
              playerImage: MyImages.player1,
              points: "0",
              incrementImage: MyImages.incrementLeft,
            ),
            Player(
              playerName: "Eles",
              playerImage: MyImages.player2,
              points: "0",
              incrementImage: MyImages.incrementRight,
            ),
          ],
        ),
        TrucoButton(),
        UndoRoundButton(),
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
